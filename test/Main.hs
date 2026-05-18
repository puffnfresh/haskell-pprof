module Main (main) where

import Control.Monad (unless)
import Hedgehog (checkParallel)
import System.Exit (exitFailure, exitSuccess)
import qualified Test.Data.Pprof.Builder
import qualified Test.Data.Pprof.Golden

main ::
  IO ()
main = do
  results <-
    traverse
      checkParallel
      [ Test.Data.Pprof.Builder.tests,
        Test.Data.Pprof.Golden.tests
      ]
  unless (and results) exitFailure
