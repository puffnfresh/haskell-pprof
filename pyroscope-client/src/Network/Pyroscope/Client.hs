{-# LANGUAGE OverloadedStrings #-}

module Network.Pyroscope.Client
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
    send,
    sendWith,
  )
where

import qualified Data.ByteString.Char8 as BS8
import qualified Data.ByteString.Lazy as BL
import qualified Data.Text as T
import Lens.Family2 ((^.))
import Network.HTTP.Client
  ( Manager,
    Request,
    RequestBody (RequestBodyBS),
    httpLbs,
    method,
    parseRequest,
    path,
    requestBody,
    requestHeaders,
    responseBody,
    responseStatus,
    setQueryString,
  )
import Network.HTTP.Client.TLS (newTlsManager)
import Network.HTTP.Types.Header (hContentType)
import Network.HTTP.Types.Status (statusCode)
import Network.Pyroscope.Client.Internal
  ( ingestContentType,
    ingestQueryParams,
  )
import Network.Pyroscope.Client.Types
  ( Aggregation (..),
    Endpoint (..),
    IngestError (..),
    Upload (..),
    defaultEndpoint,
    defaultUpload,
    epBaseUrl,
    upAggregation,
    upAppName,
    upEndNanos,
    upProfile,
    upSampleRateHz,
    upSpyName,
    upStartNanos,
  )

send ::
  Endpoint ->
  Upload ->
  IO (Either IngestError ())
send ep up = do
  mgr <- newTlsManager
  sendWith mgr ep id up

sendWith ::
  Manager ->
  Endpoint ->
  (Request -> Request) ->
  Upload ->
  IO (Either IngestError ())
sendWith mgr ep modifier up = do
  req <- buildRequest ep up
  resp <- httpLbs (modifier req) mgr
  let sc = statusCode (responseStatus resp)
  pure $
    if sc >= 200 && sc < 300
      then Right ()
      else Left (IngestError sc (BL.toStrict (responseBody resp)))

buildRequest ::
  Endpoint ->
  Upload ->
  IO Request
buildRequest (Endpoint baseUrl) up = do
  base <- parseRequest (T.unpack baseUrl)
  pure $
    setQueryString (ingestQueryParams up) $
      base
        { method = "POST",
          path = BS8.dropWhileEnd (== '/') (path base) <> "/ingest",
          requestBody = RequestBodyBS (up ^. upProfile),
          requestHeaders = [(hContentType, ingestContentType)]
        }
