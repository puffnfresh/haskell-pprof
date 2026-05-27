module Test.Data.Pprof.Golden
  ( tests,
  )
where

import qualified Codec.Compression.GZip as GZip
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BL
import qualified Data.ProtoLens as PL
import Hedgehog
  ( Group (..),
    Property,
    evalEither,
    evalIO,
    property,
    withTests,
    (===),
  )
import qualified Proto.Pprof.Profile as P

tests ::
  Group
tests =
  Group "Data.Pprof.Golden" [("prop_goldenRoundTrip", prop_goldenRoundTrip)]

prop_goldenRoundTrip ::
  Property
prop_goldenRoundTrip =
  withTests 1 . property $ do
    gz <- evalIO (BS.readFile "test/golden/go.crc32.cpu.pb.gz")
    let bytes = BL.toStrict (GZip.decompress (BL.fromStrict gz))
    profile <- evalEither (PL.decodeMessage bytes :: Either String P.Profile)
    let bytes' = PL.encodeMessage profile
    profile2 <- evalEither (PL.decodeMessage bytes')
    profile === profile2
