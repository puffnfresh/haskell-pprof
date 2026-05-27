{-# LANGUAGE OverloadedStrings #-}

module Network.Pyroscope.Client.Internal
  ( ingestQueryParams,
    ingestContentType,
  )
where

import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as BS8
import qualified Data.Text.Encoding as TE
import Network.Pyroscope.Client.Types
  ( Aggregation (..),
    Upload (..),
  )

ingestQueryParams ::
  Upload ->
  [(ByteString, Maybe ByteString)]
ingestQueryParams (Upload name _ startNanos endNanos spy rate agg) =
  [ ("name", Just (TE.encodeUtf8 name)),
    ("from", Just (BS8.pack (show (startNanos `div` 1000000000)))),
    ("until", Just (BS8.pack (show (endNanos `div` 1000000000)))),
    ("format", Just "pprof")
  ]
    <> maybe [] (\s -> [("spyName", Just (TE.encodeUtf8 s))]) spy
    <> maybe [] (\r -> [("sampleRate", Just (BS8.pack (show r)))]) rate
    <> aggParam agg
  where
    aggParam AggregationDefault =
      []
    aggParam AggregationSum =
      [("aggregationType", Just "sum")]
    aggParam AggregationAverage =
      [("aggregationType", Just "average")]

ingestContentType ::
  ByteString
ingestContentType =
  "application/octet-stream"
