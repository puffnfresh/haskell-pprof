{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Int (Int64)
import Data.Pprof
  ( Frame (..),
    ProfileMeta (..),
    addSample,
    encodeGzipped,
  )
import Data.Pprof.Time (nowNanos)
import qualified Data.Text as T
import Lens.Family2 ((&), (.~))
import qualified Network.Pyroscope.Client as P
import System.Environment (getArgs)
import System.Exit (die)

main ::
  IO ()
main = do
  args <- getArgs
  case args of
    [url, name] ->
      test (T.pack url) (T.pack name)
    _ ->
      die "usage: pyroscope-client-test <url> <app-name>"

test ::
  T.Text ->
  T.Text ->
  IO ()
test url name = do
  endNanos <- nowNanos
  let startNanos = endNanos - 10 * oneSecondNanos
      durationNanos = endNanos - startNanos
      meta =
        ProfileMeta
          [("samples", "count"), ("cpu", "nanoseconds")]
          ("cpu", "nanoseconds")
          (10 * oneMilliNanos)
          startNanos
          durationNanos
          "cpu"
      (_, profile) =
        encodeGzipped meta $
          addSample
            [Frame "Main" "test" "Main.hs" 1]
            [1, 10 * oneMilliNanos]
            []
      ep =
        P.defaultEndpoint
          & P.epBaseUrl
          .~ url
      up =
        P.defaultUpload
          & P.upAppName
          .~ name
          & P.upProfile
          .~ profile
          & P.upStartNanos
          .~ startNanos
          & P.upEndNanos
          .~ endNanos
          & P.upSpyName
          .~ Just "pyroscope_client_test"
          & P.upSampleRateHz
          .~ Just 100
  result <- P.send ep up
  case result of
    Right () -> putStrLn "OK"
    Left e -> die (show e)

oneSecondNanos ::
  Int64
oneSecondNanos =
  1000000000

oneMilliNanos ::
  Int64
oneMilliNanos =
  1000000
