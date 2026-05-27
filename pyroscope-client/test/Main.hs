{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Monad (join, unless)
import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as BS8
import Data.Int (Int64)
import Data.List (nub)
import Data.Text (Text)
import qualified Data.Text.Encoding as TE
import Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range
import Network.Pyroscope.Client
  ( Aggregation (..),
    Upload (..),
  )
import Network.Pyroscope.Client.Internal
  ( ingestContentType,
    ingestQueryParams,
  )
import System.Exit (exitFailure)

genAppName ::
  Gen Text
genAppName =
  Gen.text (Range.linear 0 64) Gen.unicodeAll

genNanos ::
  Gen Int64
genNanos =
  Gen.integral (Range.linearFrom 0 minBound maxBound)

genAggregation ::
  Gen Aggregation
genAggregation =
  Gen.element [AggregationDefault, AggregationSum, AggregationAverage]

genUpload ::
  Gen Upload
genUpload =
  Upload
    <$> genAppName
    <*> Gen.bytes (Range.linear 0 64)
    <*> genNanos
    <*> genNanos
    <*> Gen.maybe (Gen.text (Range.linear 0 16) Gen.unicodeAll)
    <*> Gen.maybe (Gen.int (Range.linear 1 100000))
    <*> genAggregation

upAppNameOf :: Upload -> Text
upAppNameOf (Upload n _ _ _ _ _ _) = n

upStartOf :: Upload -> Int64
upStartOf (Upload _ _ s _ _ _ _) = s

upEndOf :: Upload -> Int64
upEndOf (Upload _ _ _ e _ _ _) = e

upSpyOf :: Upload -> Maybe Text
upSpyOf (Upload _ _ _ _ s _ _) = s

upRateOf :: Upload -> Maybe Int
upRateOf (Upload _ _ _ _ _ r _) = r

upAggOf :: Upload -> Aggregation
upAggOf (Upload _ _ _ _ _ _ a) = a

prop_ingestQueryParams ::
  Property
prop_ingestQueryParams =
  property $ do
    up <- forAll genUpload
    let params = ingestQueryParams up
        keys = fst <$> params
        aggExpected = case upAggOf up of
          AggregationDefault -> Nothing
          AggregationSum -> Just "sum"
          AggregationAverage -> Just "average"
    keys === nub keys
    lookupParam "name" params === Just (TE.encodeUtf8 (upAppNameOf up))
    lookupParam "from" params === Just (BS8.pack (show (upStartOf up `div` 1000000000)))
    lookupParam "until" params === Just (BS8.pack (show (upEndOf up `div` 1000000000)))
    lookupParam "format" params === Just "pprof"
    lookupParam "spyName" params === fmap TE.encodeUtf8 (upSpyOf up)
    lookupParam "sampleRate" params === fmap (BS8.pack . show) (upRateOf up)
    lookupParam "aggregationType" params === aggExpected

lookupParam ::
  ByteString ->
  [(ByteString, Maybe ByteString)] ->
  Maybe ByteString
lookupParam k =
  join . lookup k

tests ::
  Group
tests =
  Group
    "Network.Pyroscope.Client"
    [ ("prop_ingestQueryParams", prop_ingestQueryParams)
    ]

main ::
  IO ()
main = do
  ok <- checkSequential tests
  unless ok exitFailure
