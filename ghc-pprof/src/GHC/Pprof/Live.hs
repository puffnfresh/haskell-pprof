{-# LANGUAGE OverloadedStrings #-}

module GHC.Pprof.Live
  ( ProfilerConfig (..),
    sampleRateHz,
    threadSelector,
    labelCollector,
    ThreadSelector (..),
    defaultProfilerConfig,
    Profiler,
    newProfiler,
    stopProfiler,
    withProfiler,
    RotatedProfiles (..),
    rotatedCpu,
    rotatedBlock,
    rotatedMutex,
    rotatedFfi,
    rotatedWallClock,
    rotateProfile,
  )
where

import Control.Concurrent (ThreadId, forkIO, myThreadId, threadDelay)
import Control.Concurrent.MVar (MVar, newEmptyMVar, putMVar, takeMVar)
import Control.Exception (SomeException, bracket, mask_, try)
import Control.Monad (forM_, unless)
import Data.ByteString (ByteString)
import Data.Foldable (traverse_)
import Data.IORef (IORef, atomicModifyIORef', newIORef, readIORef, writeIORef)
import Data.Int (Int64)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import Data.Pprof (Frame (..), Label, ProfileMeta (..), addSample, encodeGzipped)
import Data.Pprof.Time (nowNanos)
import Data.Text (Text)
import GHC.Conc.Sync (listThreads, threadStatus)
import GHC.Pprof.Live.Internal
  ( StackCounters (..),
    addCounters,
    classifyStatus,
    toFrame,
  )
import GHC.Stack.CloneStack (StackEntry, cloneThreadStack, decode)

data ThreadSelector
  = AllThreads
  | OnlyThreads (IO [ThreadId])

data ProfilerConfig
  = ProfilerConfig
      Int
      ThreadSelector
      (ThreadId -> IO [Label])

sampleRateHz ::
  (Functor f) =>
  (Int -> f Int) ->
  ProfilerConfig ->
  f ProfilerConfig
sampleRateHz f (ProfilerConfig hz sel col) =
  (\hz' -> ProfilerConfig hz' sel col) <$> f hz

threadSelector ::
  (Functor f) =>
  (ThreadSelector -> f ThreadSelector) ->
  ProfilerConfig ->
  f ProfilerConfig
threadSelector f (ProfilerConfig hz sel col) =
  (\sel' -> ProfilerConfig hz sel' col) <$> f sel

labelCollector ::
  (Functor f) =>
  ((ThreadId -> IO [Label]) -> f (ThreadId -> IO [Label])) ->
  ProfilerConfig ->
  f ProfilerConfig
labelCollector f (ProfilerConfig hz sel col) =
  (\col' -> ProfilerConfig hz sel col') <$> f col

defaultProfilerConfig ::
  ProfilerConfig
defaultProfilerConfig =
  ProfilerConfig 100 AllThreads (const (pure []))

data StackKey
  = StackKey [Frame] [Label]
  deriving (Eq, Ord)

data Profiler
  = Profiler
      (IORef (Map StackKey StackCounters))
      (IORef Int64)
      (IORef Bool)
      (MVar ())
      Int64

newProfiler ::
  ProfilerConfig ->
  IO Profiler
newProfiler (ProfilerConfig hz sel col) =
  mask_ $ do
    samplesRef <- newIORef Map.empty
    startRef <- nowNanos >>= newIORef
    stopRef <- newIORef False
    stoppedMV <- newEmptyMVar
    _ <- forkIO $ samplerLoop listTids col periodNanos samplesRef stopRef stoppedMV
    pure $
      Profiler
        samplesRef
        startRef
        stopRef
        stoppedMV
        (fromIntegral periodNanos)
  where
    periodNanos =
      max 1 (1000000000 `div` fromIntegral hz)
    listTids = case sel of
      AllThreads -> listThreads
      OnlyThreads io -> io

stopProfiler ::
  Profiler ->
  IO ()
stopProfiler (Profiler _ _ stop stopped _) = do
  writeIORef stop True
  takeMVar stopped

withProfiler ::
  ProfilerConfig ->
  (Profiler -> IO a) ->
  IO a
withProfiler cfg =
  bracket (newProfiler cfg) stopProfiler

data RotatedProfiles
  = RotatedProfiles
      ByteString
      ByteString
      ByteString
      ByteString
      ByteString

rotatedCpu ::
  (Functor f) =>
  (ByteString -> f ByteString) ->
  RotatedProfiles ->
  f RotatedProfiles
rotatedCpu f (RotatedProfiles a b c d e) =
  (\a' -> RotatedProfiles a' b c d e) <$> f a

rotatedBlock ::
  (Functor f) =>
  (ByteString -> f ByteString) ->
  RotatedProfiles ->
  f RotatedProfiles
rotatedBlock f (RotatedProfiles a b c d e) =
  (\b' -> RotatedProfiles a b' c d e) <$> f b

rotatedMutex ::
  (Functor f) =>
  (ByteString -> f ByteString) ->
  RotatedProfiles ->
  f RotatedProfiles
rotatedMutex f (RotatedProfiles a b c d e) =
  (\c' -> RotatedProfiles a b c' d e) <$> f c

rotatedFfi ::
  (Functor f) =>
  (ByteString -> f ByteString) ->
  RotatedProfiles ->
  f RotatedProfiles
rotatedFfi f (RotatedProfiles a b c d e) =
  (\d' -> RotatedProfiles a b c d' e) <$> f d

rotatedWallClock ::
  (Functor f) =>
  (ByteString -> f ByteString) ->
  RotatedProfiles ->
  f RotatedProfiles
rotatedWallClock f (RotatedProfiles a b c d e) =
  (\e' -> RotatedProfiles a b c d e') <$> f e

data Window
  = Window Int64 Int64 Int64
  deriving (Eq, Ord, Show)

rotateProfile ::
  Profiler ->
  IO RotatedProfiles
rotateProfile (Profiler samples winStart _ _ period) = do
  now <- nowNanos
  oldSamples <- atomicModifyIORef' samples (\m -> (Map.empty, m))
  oldStart <- atomicModifyIORef' winStart (\old -> (now, old))
  let window = Window period oldStart (now - oldStart)
  pure $!
    RotatedProfiles
      (buildCpuProfile window oldSamples)
      (buildContentionProfile "block" scBlock window oldSamples)
      (buildContentionProfile "mutex" scMutex window oldSamples)
      (buildContentionProfile "ffi" scFfi window oldSamples)
      (buildWallProfile window oldSamples)

samplerLoop ::
  IO [ThreadId] ->
  (ThreadId -> IO [Label]) ->
  Int ->
  IORef (Map StackKey StackCounters) ->
  IORef Bool ->
  MVar () ->
  IO ()
samplerLoop listTids collect periodNanos samplesRef stopRef stoppedMV = do
  self <- myThreadId
  let delayMicros =
        max 1 (periodNanos `div` 1000)
      loop = do
        stop <- readIORef stopRef
        if stop
          then putMVar stoppedMV ()
          else do
            tids <- listTids
            forM_ tids $ sampleOne samplesRef collect self
            threadDelay delayMicros
            loop
  loop

sampleOne ::
  IORef (Map StackKey StackCounters) ->
  (ThreadId -> IO [Label]) ->
  ThreadId ->
  ThreadId ->
  IO ()
sampleOne samplesRef collect self tid =
  unless (tid == self) $ do
    status <- threadStatus tid
    traverse_ recordBucket (classifyStatus status)
  where
    recordBucket bucket = do
      r <- try (cloneThreadStack tid >>= decode)
      traverse_ (recordEntries bucket) (r :: Either SomeException [StackEntry])
    recordEntries bucket entries =
      unless (null entries) $ do
        labels <- collect tid
        let key = StackKey (map toFrame entries) labels
        atomicModifyIORef' samplesRef $ \m ->
          (Map.insertWith addCounters key bucket m, ())

buildProfile ::
  Text ->
  Text ->
  Text ->
  (StackCounters -> Int64) ->
  Window ->
  Map StackKey StackCounters ->
  ByteString
buildProfile countAxis valueAxis defaultName pick (Window periodNanos startNanos durationNanos) counts =
  snd (encodeGzipped meta builder)
  where
    nonZero = Map.filter (\sc -> pick sc > 0) counts
    meta =
      ProfileMeta
        [(countAxis, "count"), (valueAxis, "nanoseconds")]
        (valueAxis, "nanoseconds")
        periodNanos
        startNanos
        durationNanos
        defaultName
    builder = forM_ (Map.toList nonZero) $ \(StackKey frames labels, sc) ->
      let cnt = pick sc
          values = [cnt, cnt * periodNanos]
       in addSample frames values labels

buildCpuProfile ::
  Window ->
  Map StackKey StackCounters ->
  ByteString
buildCpuProfile =
  buildProfile "samples" "cpu" "cpu" scCpu

buildContentionProfile ::
  Text ->
  (StackCounters -> Int64) ->
  Window ->
  Map StackKey StackCounters ->
  ByteString
buildContentionProfile defaultName pick =
  buildProfile "contentions" "delay" defaultName pick

buildWallProfile ::
  Window ->
  Map StackKey StackCounters ->
  ByteString
buildWallProfile =
  buildProfile "samples" "wall" "wall" (\sc -> scCpu sc + scBlock sc)
