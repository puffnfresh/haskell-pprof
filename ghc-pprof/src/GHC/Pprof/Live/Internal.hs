module GHC.Pprof.Live.Internal
  ( StackCounters (..),
    zeroCounters,
    addCounters,
    classifyStatus,
    parseSrcLoc,
    nowNanos,
    toFrame,
  )
where

import Data.Int (Int64)
import Data.Pprof (Frame (..))
import Data.Text (Text)
import qualified Data.Text as T
import Data.Time.Clock.POSIX (getPOSIXTime)
import GHC.Conc.Sync (BlockReason (..), ThreadStatus (..))
import GHC.Stack.CloneStack (StackEntry (..))

data StackCounters = StackCounters
  { scCpu :: {-# UNPACK #-} !Int64,
    scBlock :: {-# UNPACK #-} !Int64,
    scMutex :: {-# UNPACK #-} !Int64,
    scFfi :: {-# UNPACK #-} !Int64
  }
  deriving (Eq, Show)

zeroCounters ::
  StackCounters
zeroCounters =
  StackCounters 0 0 0 0

addCounters ::
  StackCounters ->
  StackCounters ->
  StackCounters
addCounters (StackCounters a b c d) (StackCounters a' b' c' d') =
  StackCounters (a + a') (b + b') (c + c') (d + d')

classifyStatus ::
  ThreadStatus ->
  Maybe StackCounters
classifyStatus ThreadRunning =
  Just zeroCounters {scCpu = 1}
classifyStatus (ThreadBlocked BlockedOnMVar) =
  Just zeroCounters {scBlock = 1, scMutex = 1}
classifyStatus (ThreadBlocked BlockedOnSTM) =
  Just zeroCounters {scBlock = 1, scMutex = 1}
classifyStatus (ThreadBlocked BlockedOnForeignCall) =
  Just zeroCounters {scBlock = 1, scFfi = 1}
classifyStatus (ThreadBlocked BlockedOnBlackHole) =
  Just zeroCounters {scBlock = 1}
classifyStatus (ThreadBlocked BlockedOnException) =
  Just zeroCounters {scBlock = 1}
classifyStatus (ThreadBlocked BlockedOnOther) =
  Just zeroCounters {scBlock = 1}
classifyStatus ThreadFinished =
  Nothing
classifyStatus ThreadDied =
  Nothing

parseSrcLoc ::
  String ->
  (Text, Int64)
parseSrcLoc s = case break (== ':') s of
  ("", _) -> (T.empty, 0)
  (_, "") -> (T.pack s, 0)
  (file, ':' : rest) -> (T.pack file, readLeadingInt rest)
  (file, _) -> (T.pack file, 0)

readLeadingInt ::
  String ->
  Int64
readLeadingInt str = case dropWhile (== '(') str of
  s -> case reads s :: [(Int64, String)] of
    ((n, _) : _) -> n
    _ -> 0

nowNanos ::
  IO Int64
nowNanos = do
  t <- getPOSIXTime
  pure $! floor (realToFrac t * (1e9 :: Double) :: Double)

toFrame ::
  StackEntry ->
  Frame
toFrame se =
  Frame
    (T.pack (moduleName se))
    (T.pack (functionName se))
    file
    line
  where
    (file, line) = parseSrcLoc (srcLoc se)
