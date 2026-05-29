{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}

module Network.Pyroscope.GHC
  ( Config (..),
    configServerAddress,
    configApplicationName,
    configSampleRateHz,
    configUploadIntervalSeconds,
    configRequestModifier,
    configOnUploadError,
    configLabelCollector,
    defaultConfig,
    configFromEnv,
    Pyroscope,
    start,
    stop,
    withPyroscope,
    withPyroscopeEnv,
    withLabels,
  )
where

import Control.Concurrent (ThreadId, forkIO, threadDelay)
import Control.Concurrent.MVar (MVar, newEmptyMVar, putMVar, takeMVar)
import Control.Exception (bracket, mask_)
import qualified Data.ByteString.Char8 as BS8
import Data.IORef (IORef, newIORef, readIORef, writeIORef)
import Data.Int (Int64)
import Data.Pprof (Label)
import Data.Pprof.Time (nowNanos)
import Data.Text (Text)
import qualified Data.Text as T
import GHC.Pprof.Live
  ( Profiler,
    RotatedProfiles,
    defaultProfilerConfig,
    labelCollector,
    newProfiler,
    rotateProfile,
    rotatedBlock,
    rotatedCpu,
    rotatedFfi,
    rotatedMutex,
    rotatedWallClock,
    sampleRateHz,
    stopProfiler,
  )
import qualified GHC.Pprof.Live.Labels as Labels
import GHC.Pprof.Live.OpenTelemetry (openTelemetryLabels)
import Lens.Family2 (Lens', (&), (.~), (^.))
import Network.HTTP.Client
  ( Manager,
    Request,
    applyBasicAuth,
    applyBearerAuth,
    defaultManagerSettings,
    newManager,
    requestHeaders,
  )
import qualified Network.Pyroscope.Client as P
import System.Environment (lookupEnv)
import Text.Read (readMaybe)

data Config
  = Config
      !Text
      !Text
      !Int
      !Int
      !(Request -> Request)
      !(P.IngestError -> IO ())
      !(ThreadId -> IO [Label])

configServerAddress ::
  Lens' Config Text
configServerAddress f (Config s n h i m e l) =
  (\s' -> Config s' n h i m e l) <$> f s

configApplicationName ::
  Lens' Config Text
configApplicationName f (Config s n h i m e l) =
  (\n' -> Config s n' h i m e l) <$> f n

configSampleRateHz ::
  Lens' Config Int
configSampleRateHz f (Config s n h i m e l) =
  (\h' -> Config s n h' i m e l) <$> f h

configUploadIntervalSeconds ::
  Lens' Config Int
configUploadIntervalSeconds f (Config s n h i m e l) =
  (\i' -> Config s n h i' m e l) <$> f i

configRequestModifier ::
  Lens' Config (Request -> Request)
configRequestModifier f (Config s n h i m e l) =
  (\m' -> Config s n h i m' e l) <$> f m

configOnUploadError ::
  Lens' Config (P.IngestError -> IO ())
configOnUploadError f (Config s n h i m e l) =
  (\e' -> Config s n h i m e' l) <$> f e

configLabelCollector ::
  Lens' Config (ThreadId -> IO [Label])
configLabelCollector f (Config s n h i m e l) =
  Config s n h i m e <$> f l

defaultConfig ::
  Config
defaultConfig =
  Config
    "http://localhost:4040"
    "haskell_app"
    100
    10
    id
    (const (pure ()))
    openTelemetryLabels

configFromEnv ::
  IO Config
configFromEnv = do
  modifier <- requestModifierFromEnv
  pure (defaultConfig & configRequestModifier .~ modifier)
    >>= overrideFromEnv configServerAddress (Just . T.pack) "PYROSCOPE_SERVER_ADDRESS"
    >>= overrideFromEnv configApplicationName (Just . T.pack) "PYROSCOPE_APPLICATION_NAME"
    >>= overrideFromEnv configSampleRateHz readMaybe "PYROSCOPE_SAMPLE_RATE"
    >>= overrideFromEnv configUploadIntervalSeconds readMaybe "PYROSCOPE_UPLOAD_RATE"

overrideFromEnv ::
  Lens' Config a ->
  (String -> Maybe a) ->
  String ->
  Config ->
  IO Config
overrideFromEnv lens parse key cfg = do
  mv <- (>>= parse) <$> lookupEnv key
  pure $ maybe cfg (\v -> cfg & lens .~ v) mv

requestModifierFromEnv ::
  IO (Request -> Request)
requestModifierFromEnv = do
  bearer <- lookupEnv "PYROSCOPE_AUTH_TOKEN"
  user <- lookupEnv "PYROSCOPE_BASIC_AUTH_USER"
  pass <- lookupEnv "PYROSCOPE_BASIC_AUTH_PASSWORD"
  tenant <- lookupEnv "PYROSCOPE_TENANT_ID"
  let auth = case (bearer, user, pass) of
        (Just t, _, _) ->
          applyBearerAuth (BS8.pack t)
        (_, Just u, Just p) ->
          applyBasicAuth (BS8.pack u) (BS8.pack p)
        _ ->
          id
      tenantHdr = case tenant of
        Just t ->
          \r ->
            r {requestHeaders = ("X-Scope-OrgID", BS8.pack t) : requestHeaders r}
        Nothing ->
          id
  pure (tenantHdr . auth)

data Pyroscope
  = Pyroscope
      Profiler
      (IORef Bool)
      (MVar ())
      Labels.LabelStore

start ::
  Config ->
  IO Pyroscope
start config = mask_ $ do
  store <- Labels.newLabelStore
  let extraCollector = config ^. configLabelCollector
      collector tid = do
        scoped <- Labels.collectLabels store tid
        extra <- extraCollector tid
        pure (scoped <> extra)
  let profilerConfig =
        defaultProfilerConfig
          & sampleRateHz .~ (config ^. configSampleRateHz)
          & labelCollector .~ collector
  profiler <- newProfiler profilerConfig
  mgr <- newManager defaultManagerSettings
  stopRef <- newIORef False
  doneMV <- newEmptyMVar
  startNs <- nowNanos
  _ <- forkIO $ uploaderLoop config profiler mgr stopRef doneMV startNs
  pure $ Pyroscope profiler stopRef doneMV store

stop ::
  Pyroscope ->
  IO ()
stop (Pyroscope profiler stopRef doneMV _) = do
  writeIORef stopRef True
  takeMVar doneMV
  stopProfiler profiler

withPyroscope ::
  Config ->
  (Pyroscope -> IO a) ->
  IO a
withPyroscope config =
  bracket (start config) stop

withPyroscopeEnv ::
  (Pyroscope -> IO a) ->
  IO a
withPyroscopeEnv k = do
  config <- configFromEnv
  withPyroscope config k

withLabels ::
  Pyroscope ->
  [Label] ->
  IO a ->
  IO a
withLabels (Pyroscope _ _ _ store) =
  Labels.withLabels store

uploaderLoop ::
  Config ->
  Profiler ->
  Manager ->
  IORef Bool ->
  MVar () ->
  Int64 ->
  IO ()
uploaderLoop config profiler mgr stopRef doneMV = loop
  where
    intervalMicros =
      max 1 (config ^. configUploadIntervalSeconds) * 1000000
    loop windowStart = do
      threadDelay intervalMicros
      stopFlag <- readIORef stopRef
      windowEnd <- nowNanos
      rotated <- rotateProfile profiler
      uploadAll config mgr windowStart windowEnd rotated
      if stopFlag
        then putMVar doneMV ()
        else loop windowEnd

uploadAll ::
  Config ->
  Manager ->
  Int64 ->
  Int64 ->
  RotatedProfiles ->
  IO ()
uploadAll config mgr startNs endNs rotated = do
  uploadOne (rotated ^. rotatedCpu)
  uploadOne (rotated ^. rotatedBlock)
  uploadOne (rotated ^. rotatedMutex)
  uploadOne (rotated ^. rotatedFfi)
  uploadOne (rotated ^. rotatedWallClock)
  where
    endpoint =
      P.defaultEndpoint
        & P.epBaseUrl
          .~ (config ^. configServerAddress)
    modifier =
      config ^. configRequestModifier
    onErr =
      config ^. configOnUploadError
    uploadOne profile = do
      let up =
            P.defaultUpload
              & P.upAppName .~ (config ^. configApplicationName)
              & P.upProfile .~ profile
              & P.upStartNanos .~ startNs
              & P.upEndNanos .~ endNs
              & P.upSpyName .~ Just "pyroscope-ghc"
              & P.upSampleRateHz .~ Just (config ^. configSampleRateHz)
      result <- P.sendWith mgr endpoint modifier up
      case result of
        Right () -> pure ()
        Left e -> onErr e
