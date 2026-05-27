{-# LANGUAGE OverloadedStrings #-}

module Network.Pyroscope.Client.Types
  ( Endpoint (..),
    epBaseUrl,
    defaultEndpoint,
    Upload (..),
    upAppName,
    upProfile,
    upStartNanos,
    upEndNanos,
    upSpyName,
    upSampleRateHz,
    upAggregation,
    defaultUpload,
    Aggregation (..),
    IngestError (..),
  )
where

import Control.Exception (Exception)
import Data.ByteString (ByteString)
import qualified Data.ByteString as BS
import Data.Int (Int64)
import Data.Text (Text)
import Lens.Family2 (Lens')

newtype Endpoint
  = Endpoint
      Text
  deriving (Eq, Ord, Show)

epBaseUrl ::
  Lens' Endpoint Text
epBaseUrl f (Endpoint u) =
  Endpoint <$> f u

defaultEndpoint ::
  Endpoint
defaultEndpoint =
  Endpoint "http://localhost:4040"

data Aggregation
  = AggregationDefault
  | AggregationSum
  | AggregationAverage
  deriving (Eq, Ord, Show)

data Upload
  = Upload
      !Text
      !ByteString
      !Int64
      !Int64
      !(Maybe Text)
      !(Maybe Int)
      !Aggregation
  deriving (Eq, Ord, Show)

upAppName ::
  Lens' Upload Text
upAppName f (Upload n b s e sp sr ag) =
  (\n' -> Upload n' b s e sp sr ag) <$> f n

upProfile ::
  Lens' Upload ByteString
upProfile f (Upload n b s e sp sr ag) =
  (\b' -> Upload n b' s e sp sr ag) <$> f b

upStartNanos ::
  Lens' Upload Int64
upStartNanos f (Upload n b s e sp sr ag) =
  (\s' -> Upload n b s' e sp sr ag) <$> f s

upEndNanos ::
  Lens' Upload Int64
upEndNanos f (Upload n b s e sp sr ag) =
  (\e' -> Upload n b s e' sp sr ag) <$> f e

upSpyName ::
  Lens' Upload (Maybe Text)
upSpyName f (Upload n b s e sp sr ag) =
  (\sp' -> Upload n b s e sp' sr ag) <$> f sp

upSampleRateHz ::
  Lens' Upload (Maybe Int)
upSampleRateHz f (Upload n b s e sp sr ag) =
  (\sr' -> Upload n b s e sp sr' ag) <$> f sr

upAggregation ::
  Lens' Upload Aggregation
upAggregation f (Upload n b s e sp sr ag) =
  Upload n b s e sp sr <$> f ag

defaultUpload ::
  Upload
defaultUpload =
  Upload "" BS.empty 0 0 Nothing Nothing AggregationDefault

data IngestError
  = IngestError
      !Int
      !ByteString
  deriving (Eq, Ord, Show)
