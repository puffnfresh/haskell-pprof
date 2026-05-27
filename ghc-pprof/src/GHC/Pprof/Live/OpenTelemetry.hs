module GHC.Pprof.Live.OpenTelemetry
  ( openTelemetryLabels,
  )
where

import Control.Concurrent (ThreadId)
import Data.ByteArray.Encoding (Base (Base16))
import Data.Pprof (Label (..), LabelValue (..))
import qualified Data.Text as T
import OpenTelemetry.Context (lookupSpan)
import OpenTelemetry.Context.ThreadLocal (lookupContextOnThread)
import OpenTelemetry.Trace.Core (SpanContext (..), getSpanContext)
import OpenTelemetry.Trace.Id (spanIdBaseEncodedText, traceIdBaseEncodedText)

openTelemetryLabels ::
  ThreadId ->
  IO [Label]
openTelemetryLabels tid = do
  mCtx <- lookupContextOnThread tid
  sc <- traverse getSpanContext (mCtx >>= lookupSpan)
  pure (foldMap labelsFor sc)
  where
    labelsFor sc' =
      [ Label
          (T.pack "trace_id")
          (LabelString (traceIdBaseEncodedText Base16 (traceId sc'))),
        Label
          (T.pack "span_id")
          (LabelString (spanIdBaseEncodedText Base16 (spanId sc')))
      ]
