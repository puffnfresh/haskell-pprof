{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Concurrent (myThreadId, threadDelay)
import Control.Exception (bracket)
import Control.Monad (unless)
import Control.Monad.IO.Class (liftIO)
import Data.ByteString (ByteString)
import qualified Data.ByteString as BS
import Data.Int (Int64)
import GHC.Conc.Sync (BlockReason (..), ThreadStatus (..))
import GHC.Pprof.Live
  ( RotatedProfiles (..),
    defaultProfilerConfig,
    rotateProfile,
    withProfiler,
  )
import GHC.Pprof.Live.Internal
  ( StackCounters (..),
    addCounters,
    classifyStatus,
    parseSrcLoc,
    zeroCounters,
  )
import GHC.Pprof.Live.OpenTelemetry (openTelemetryLabels)
import GHC.Pprof.Live.Threads (captureThreadProfile)
import Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range
import OpenTelemetry.Trace
  ( defaultSpanArguments,
    inSpan,
    initializeGlobalTracerProvider,
    makeTracer,
    shutdownTracerProvider,
    tracerOptions,
  )
import System.Exit (exitFailure)

genStackCounters ::
  Gen StackCounters
genStackCounters =
  StackCounters
    <$> genCount
    <*> genCount
    <*> genCount
    <*> genCount
  where
    genCount = Gen.integral (Range.linear 0 1000000 :: Range.Range Int64)

genBlockReason ::
  Gen BlockReason
genBlockReason =
  Gen.element
    [ BlockedOnMVar,
      BlockedOnSTM,
      BlockedOnForeignCall,
      BlockedOnBlackHole,
      BlockedOnException,
      BlockedOnOther
    ]

prop_addCounters_associative ::
  Property
prop_addCounters_associative =
  property $ do
    a <- forAll genStackCounters
    b <- forAll genStackCounters
    c <- forAll genStackCounters
    addCounters (addCounters a b) c === addCounters a (addCounters b c)

prop_addCounters_commutative ::
  Property
prop_addCounters_commutative =
  property $ do
    a <- forAll genStackCounters
    b <- forAll genStackCounters
    addCounters a b === addCounters b a

prop_addCounters_leftIdentity ::
  Property
prop_addCounters_leftIdentity =
  property $ do
    a <- forAll genStackCounters
    addCounters zeroCounters a === a

prop_addCounters_rightIdentity ::
  Property
prop_addCounters_rightIdentity =
  property $ do
    a <- forAll genStackCounters
    addCounters a zeroCounters === a

prop_addCounters_distributesOverFields ::
  Property
prop_addCounters_distributesOverFields =
  property $ do
    a <- forAll genStackCounters
    b <- forAll genStackCounters
    let c = addCounters a b
    scCpu c === scCpu a + scCpu b
    scBlock c === scBlock a + scBlock b
    scMutex c === scMutex a + scMutex b
    scFfi c === scFfi a + scFfi b

prop_classify_runningHitsOnlyCpu ::
  Property
prop_classify_runningHitsOnlyCpu =
  withTests 1 . property $
    classifyStatus ThreadRunning === Just zeroCounters {scCpu = 1}

prop_classify_blockedAlwaysIncrementsBlock ::
  Property
prop_classify_blockedAlwaysIncrementsBlock =
  property $ do
    reason <- forAll genBlockReason
    case classifyStatus (ThreadBlocked reason) of
      Just sc -> do
        scBlock sc === 1
        scCpu sc === 0
      Nothing -> failure

prop_classify_mutexIsSubsetOfBlock ::
  Property
prop_classify_mutexIsSubsetOfBlock =
  property $ do
    reason <- forAll genBlockReason
    case classifyStatus (ThreadBlocked reason) of
      Just sc -> assert (scMutex sc <= scBlock sc)
      Nothing -> failure

prop_classify_ffiIsSubsetOfBlock ::
  Property
prop_classify_ffiIsSubsetOfBlock =
  property $ do
    reason <- forAll genBlockReason
    case classifyStatus (ThreadBlocked reason) of
      Just sc -> assert (scFfi sc <= scBlock sc)
      Nothing -> failure

prop_classify_terminatedThreadsYieldNothing ::
  Property
prop_classify_terminatedThreadsYieldNothing =
  withTests 1 . property $ do
    classifyStatus ThreadFinished === Nothing
    classifyStatus ThreadDied === Nothing

prop_parseSrcLoc_simple ::
  Property
prop_parseSrcLoc_simple =
  withTests 1 . property $
    parseSrcLoc "Foo/Bar.hs:42:5-10" === ("Foo/Bar.hs", 42)

prop_parseSrcLoc_parenForm ::
  Property
prop_parseSrcLoc_parenForm =
  withTests 1 . property $
    parseSrcLoc "Foo.hs:(42,5)-(43,10)" === ("Foo.hs", 42)

prop_parseSrcLoc_empty ::
  Property
prop_parseSrcLoc_empty =
  withTests 1 . property $
    parseSrcLoc "" === ("", 0)

prop_parseSrcLoc_noColon ::
  Property
prop_parseSrcLoc_noColon =
  withTests 1 . property $
    parseSrcLoc "Foo.hs" === ("Foo.hs", 0)

prop_parseSrcLoc_nonNumericLine ::
  Property
prop_parseSrcLoc_nonNumericLine =
  withTests 1 . property $
    parseSrcLoc "Foo.hs:abc" === ("Foo.hs", 0)

isGzip ::
  ByteString ->
  Bool
isGzip bs =
  BS.length bs >= 2 && BS.index bs 0 == 0x1f && BS.index bs 1 == 0x8b

prop_rotateProfile_emitsFiveGzippedProfiles ::
  Property
prop_rotateProfile_emitsFiveGzippedProfiles =
  withTests 1 . property $ do
    RotatedProfiles cpu block mutex ffi wall <-
      liftIO . withProfiler defaultProfilerConfig $ \prof -> do
        threadDelay 50000
        rotateProfile prof
    assert (isGzip cpu)
    assert (isGzip block)
    assert (isGzip mutex)
    assert (isGzip ffi)
    assert (isGzip wall)

prop_captureThreadProfile_returnsGzipped ::
  Property
prop_captureThreadProfile_returnsGzipped =
  withTests 1 . property $ do
    bs <- liftIO captureThreadProfile
    assert (isGzip bs)

prop_otelLabels_emptyContextYieldsNoLabels ::
  Property
prop_otelLabels_emptyContextYieldsNoLabels =
  withTests 1 . property $ do
    labels <- liftIO $ do
      tid <- myThreadId
      openTelemetryLabels tid
    labels === []

prop_otelLabels_insideSpanYieldsTraceAndSpanId ::
  Property
prop_otelLabels_insideSpanYieldsTraceAndSpanId =
  withTests 1 . property $ do
    count <- liftIO $
      bracket initializeGlobalTracerProvider shutdownTracerProvider $ \tp -> do
        let tracer = makeTracer tp "ghc-pprof-test" tracerOptions
        inSpan tracer "test-span" defaultSpanArguments $ do
          tid <- myThreadId
          labels <- openTelemetryLabels tid
          pure (length labels)
    count === 2

tests :: Group
tests =
  Group
    "GHC.Pprof.Live"
    [ ("prop_addCounters_associative", prop_addCounters_associative),
      ("prop_addCounters_commutative", prop_addCounters_commutative),
      ("prop_addCounters_leftIdentity", prop_addCounters_leftIdentity),
      ("prop_addCounters_rightIdentity", prop_addCounters_rightIdentity),
      ("prop_addCounters_distributesOverFields", prop_addCounters_distributesOverFields),
      ("prop_classify_runningHitsOnlyCpu", prop_classify_runningHitsOnlyCpu),
      ("prop_classify_blockedAlwaysIncrementsBlock", prop_classify_blockedAlwaysIncrementsBlock),
      ("prop_classify_mutexIsSubsetOfBlock", prop_classify_mutexIsSubsetOfBlock),
      ("prop_classify_ffiIsSubsetOfBlock", prop_classify_ffiIsSubsetOfBlock),
      ("prop_classify_terminatedThreadsYieldNothing", prop_classify_terminatedThreadsYieldNothing),
      ("prop_parseSrcLoc_simple", prop_parseSrcLoc_simple),
      ("prop_parseSrcLoc_parenForm", prop_parseSrcLoc_parenForm),
      ("prop_parseSrcLoc_empty", prop_parseSrcLoc_empty),
      ("prop_parseSrcLoc_noColon", prop_parseSrcLoc_noColon),
      ("prop_parseSrcLoc_nonNumericLine", prop_parseSrcLoc_nonNumericLine),
      ("prop_rotateProfile_emitsFiveGzippedProfiles", prop_rotateProfile_emitsFiveGzippedProfiles),
      ("prop_captureThreadProfile_returnsGzipped", prop_captureThreadProfile_returnsGzipped),
      ("prop_otelLabels_emptyContextYieldsNoLabels", prop_otelLabels_emptyContextYieldsNoLabels),
      ("prop_otelLabels_insideSpanYieldsTraceAndSpanId", prop_otelLabels_insideSpanYieldsTraceAndSpanId)
    ]

main :: IO ()
main = do
  ok <- checkSequential tests
  unless ok exitFailure
