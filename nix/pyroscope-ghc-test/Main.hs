{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Monad (when)
import Data.Int (Int64)
import Data.IORef (atomicModifyIORef', newIORef, readIORef)
import Data.Pprof.Time (nowNanos)
import qualified Data.Text as T
import Lens.Family2 ((&), (.~))
import qualified Network.Pyroscope.GHC as Pyro
import System.Environment (getArgs)
import System.Exit (die)

main ::
  IO ()
main = do
  args <- getArgs
  case args of
    [url, name, seconds] ->
      agent (T.pack url) (T.pack name) (read seconds)
    _ ->
      die "usage: pyroscope-ghc-test <url> <app-name> <seconds>"

agent ::
  T.Text ->
  T.Text ->
  Int ->
  IO ()
agent url name seconds = do
  errors <- newIORef (0 :: Int)
  let config =
        Pyro.defaultConfig
          & Pyro.configServerAddress
          .~ url
          & Pyro.configApplicationName
          .~ name
          & Pyro.configSampleRateHz
          .~ 100
          & Pyro.configUploadIntervalSeconds
          .~ 3
          & Pyro.configOnUploadError
          .~ ( \e -> do
                 putStrLn ("upload error: " <> show e)
                 atomicModifyIORef' errors (\n -> (n + 1, ()))
             )
  Pyro.withPyroscope config $ \_ -> do
    start <- nowNanos
    let deadline = start + fromIntegral seconds * oneSecondNanos
    busyUntil deadline
  errorCount <- readIORef errors
  when (errorCount > 0) $
    die ("had " <> show errorCount <> " upload errors")
  putStrLn "agent done"

busyUntil ::
  Int64 ->
  IO ()
busyUntil deadlineNs = do
  let !_ = sum [1 .. 1000 :: Int]
  now <- nowNanos
  when (now < deadlineNs) (busyUntil deadlineNs)

oneSecondNanos ::
  Int64
oneSecondNanos =
  1000000000
