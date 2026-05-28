module Data.Pprof.Time
  ( nowNanos,
  )
where

import Data.Int (Int64)
import Data.Time.Clock.POSIX (getPOSIXTime)

nowNanos ::
  IO Int64
nowNanos = do
  t <- getPOSIXTime
  pure $! floor (realToFrac t * (1e9 :: Double) :: Double)
