module Data.Pprof
  ( module Data.Pprof.Types,
    Builder,
    runBuilder,
    addSample,
    encode,
    encodeGzipped,
  )
where

import qualified Codec.Compression.GZip as GZip
import Data.ByteString (ByteString)
import qualified Data.ByteString.Lazy as BL
import Data.Pprof.Builder (Builder, addSample, runBuilder)
import Data.Pprof.Types
import qualified Data.ProtoLens as PL

encode ::
  ProfileMeta ->
  Builder a ->
  (a, ByteString)
encode meta body =
  let (a, profile) = runBuilder meta body
   in (a, PL.encodeMessage profile)

encodeGzipped ::
  ProfileMeta ->
  Builder a ->
  (a, ByteString)
encodeGzipped meta body =
  let (a, bs) = encode meta body
   in (a, BL.toStrict (GZip.compress (BL.fromStrict bs)))
