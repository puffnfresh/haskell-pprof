module Test.Data.Pprof.Builder
  ( tests,
  )
where

import Control.Monad (unless)
import qualified Data.ByteString as BS
import Data.Foldable (for_)
import Data.Int (Int64)
import Data.List (nub)
import Data.Pprof
import qualified Data.ProtoLens as PL
import Data.ProtoLens.Runtime.Lens.Family2 ((^.))
import qualified Data.Set as Set
import Data.Word (Word64)
import Hedgehog
  ( Group (..),
    Property,
    PropertyName,
    forAll,
    property,
    withTests,
    (===),
  )
import qualified Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range
import qualified Proto.Pprof.Profile as P
import qualified Proto.Pprof.Profile_Fields as PF
import Test.Data.Pprof.Gen

tests ::
  Group
tests =
  Group "Data.Pprof.Builder" properties

properties ::
  [(PropertyName, Property)]
properties =
  [ ("prop_emptyStringAtIndexZero", prop_emptyStringAtIndexZero),
    ("prop_stringTableUnique", prop_stringTableUnique),
    ("prop_functionsUnique", prop_functionsUnique),
    ("prop_locationsUnique", prop_locationsUnique),
    ("prop_locationRefsValid", prop_locationRefsValid),
    ("prop_functionRefsValid", prop_functionRefsValid),
    ("prop_stringRefsInRange", prop_stringRefsInRange),
    ("prop_emptyProfileRoundTrips", prop_emptyProfileRoundTrips),
    ("prop_roundTrip", prop_roundTrip),
    ("prop_internIsIdempotent", prop_internIsIdempotent),
    ("prop_sampleOrderingPreserved", prop_sampleOrderingPreserved),
    ("prop_sampleArityMatches", prop_sampleArityMatches),
    ("prop_metadataPropagated", prop_metadataPropagated),
    ("prop_singleMappingPresent", prop_singleMappingPresent),
    ("prop_gzippedHeaderIsValid", prop_gzippedHeaderIsValid),
    ("prop_defaultProfileMetaRoundTrips", prop_defaultProfileMetaRoundTrips)
  ]

fromEntries ::
  [SampleEntry] ->
  Builder ()
fromEntries =
  mapM_ (\(SampleEntry s v l) -> addSample s v l)

profileOf ::
  ProfileMeta ->
  [SampleEntry] ->
  P.Profile
profileOf meta entries =
  snd (runBuilder meta (fromEntries entries))

genCase ::
  Hedgehog.Gen (ProfileMeta, [SampleEntry])
genCase = do
  meta <- genMeta
  let arity = length (meta ^. pmSampleTypes)
  entries <- Gen.list (Range.linear 0 12) (genSampleEntry arity)
  pure (meta, entries)

prop_emptyStringAtIndexZero ::
  Property
prop_emptyStringAtIndexZero =
  property $ do
    (meta, entries) <- forAll genCase
    let profile = profileOf meta entries
        strs = profile ^. PF.stringTable
    case strs of
      [] -> Hedgehog.failure
      (s : _) -> s === ""

prop_stringTableUnique ::
  Property
prop_stringTableUnique =
  property $ do
    (meta, entries) <- forAll genCase
    let profile = profileOf meta entries
        strs = profile ^. PF.stringTable
    length strs === length (nub strs)

prop_functionsUnique ::
  Property
prop_functionsUnique =
  property $ do
    (meta, entries) <- forAll genCase
    let profile = profileOf meta entries
        fns = profile ^. PF.function
        keys = map functionKey fns
        ids = map (^. PF.id) fns
    length keys === length (nub keys)
    length ids === length (nub ids)

functionKey ::
  P.Function ->
  (Int64, Int64, Int64, Int64)
functionKey fn =
  ( fn ^. PF.name,
    fn ^. PF.systemName,
    fn ^. PF.filename,
    fn ^. PF.startLine
  )

prop_locationsUnique ::
  Property
prop_locationsUnique =
  property $ do
    (meta, entries) <- forAll genCase
    let profile = profileOf meta entries
        locs = profile ^. PF.location
        keys = map locationKey locs
        ids = map (^. PF.id) locs
    length keys === length (nub keys)
    length ids === length (nub ids)

locationKey ::
  P.Location ->
  [(Word64, Int64)]
locationKey loc = do
  ln <- loc ^. PF.line
  pure (ln ^. PF.functionId, ln ^. PF.line)

prop_locationRefsValid ::
  Property
prop_locationRefsValid =
  property $ do
    (meta, entries) <- forAll genCase
    let profile = profileOf meta entries
        knownLocIds = Set.fromList [loc ^. PF.id | loc <- profile ^. PF.location]
    for_ (profile ^. PF.sample) $ \s ->
      for_ (s ^. PF.locationId) $ \lid ->
        Hedgehog.assert (Set.member lid knownLocIds)

prop_functionRefsValid ::
  Property
prop_functionRefsValid =
  property $ do
    (meta, entries) <- forAll genCase
    let profile = profileOf meta entries
        knownFnIds = Set.fromList [fn ^. PF.id | fn <- profile ^. PF.function]
    for_ (profile ^. PF.location) $ \loc ->
      for_ (loc ^. PF.line) $ \ln ->
        Hedgehog.assert (Set.member (ln ^. PF.functionId) knownFnIds)

prop_stringRefsInRange ::
  Property
prop_stringRefsInRange =
  property $ do
    (meta, entries) <- forAll genCase
    let profile = profileOf meta entries
        n = length (profile ^. PF.stringTable)
        valid i = i >= 0 && fromIntegral i < n

    for_ (profile ^. PF.function) $ \fn -> do
      Hedgehog.assert (valid (fn ^. PF.name))
      Hedgehog.assert (valid (fn ^. PF.systemName))
      Hedgehog.assert (valid (fn ^. PF.filename))

    for_ (profile ^. PF.sampleType) $ \vt -> do
      Hedgehog.assert (valid (vt ^. PF.type'))
      Hedgehog.assert (valid (vt ^. PF.unit))

    let pt = profile ^. PF.periodType
    Hedgehog.assert (valid (pt ^. PF.type'))
    Hedgehog.assert (valid (pt ^. PF.unit))

    for_ (profile ^. PF.sample) $ \s ->
      for_ (s ^. PF.label) $ \lb -> do
        Hedgehog.assert (valid (lb ^. PF.key))
        Hedgehog.assert (valid (lb ^. PF.str))
        Hedgehog.assert (valid (lb ^. PF.numUnit))

decodeProfile ::
  BS.ByteString ->
  Either String P.Profile
decodeProfile =
  PL.decodeMessage

prop_emptyProfileRoundTrips ::
  Property
prop_emptyProfileRoundTrips =
  withTests 1 $ property $ do
    meta <- forAll genMeta
    let (_, bs) = encode meta (pure ())
    case decodeProfile bs of
      Left e -> do
        Hedgehog.annotate e
        Hedgehog.failure
      Right decoded -> do
        let profile = snd (runBuilder meta (pure ()))
        decoded === profile

prop_roundTrip ::
  Property
prop_roundTrip =
  property $ do
    (meta, entries) <- forAll genCase
    let profile = profileOf meta entries
        bs = PL.encodeMessage profile
    case decodeProfile bs of
      Left e -> do
        Hedgehog.annotate e
        Hedgehog.failure
      Right decoded ->
        decoded === profile

prop_internIsIdempotent ::
  Property
prop_internIsIdempotent =
  property $ do
    meta <- forAll genMeta
    let arity = length (meta ^. pmSampleTypes)
    entry <- forAll (genSampleEntry arity)
    let SampleEntry s v l = entry
        doubled = profileOf meta [SampleEntry s v l, SampleEntry s v l]
        samples = doubled ^. PF.sample
    case samples of
      [a, b] ->
        (a ^. PF.locationId) === (b ^. PF.locationId)
      _ -> do
        Hedgehog.annotate ("expected 2 samples, got " <> show (length samples))
        Hedgehog.failure

prop_sampleOrderingPreserved ::
  Property
prop_sampleOrderingPreserved = property $ do
  (meta, entries) <- forAll genCase
  let profile = profileOf meta entries
      gotValues = map (^. PF.value) (profile ^. PF.sample)
      wantValues = map (^. seValues) entries
  gotValues === wantValues

prop_sampleArityMatches ::
  Property
prop_sampleArityMatches = property $ do
  (meta, entries) <- forAll genCase
  let profile = profileOf meta entries
      arity = length (meta ^. pmSampleTypes)
  for_ (profile ^. PF.sample) $ \s ->
    length (s ^. PF.value) === arity
  unless (null entries) $
    Hedgehog.assert (all (\e -> length (e ^. seValues) == arity) entries)

prop_metadataPropagated ::
  Property
prop_metadataPropagated = property $ do
  (meta, entries) <- forAll genCase
  let profile = profileOf meta entries
  (profile ^. PF.timeNanos) === meta ^. pmTimeNanos
  (profile ^. PF.durationNanos) === meta ^. pmDurationNanos
  (profile ^. PF.period) === meta ^. pmPeriod
  length (profile ^. PF.sampleType) === length (meta ^. pmSampleTypes)

prop_singleMappingPresent ::
  Property
prop_singleMappingPresent = property $ do
  (meta, entries) <- forAll genCase
  let profile = profileOf meta entries
      mappings = profile ^. PF.mapping
  length mappings === 1
  case mappings of
    [m] -> do
      (m ^. PF.id) === 1
      (m ^. PF.hasFunctions) === True
    _ -> Hedgehog.failure

prop_gzippedHeaderIsValid ::
  Property
prop_gzippedHeaderIsValid = property $ do
  (meta, entries) <- forAll genCase
  let (_, gz) = encodeGzipped meta (fromEntries entries)
  case BS.unpack (BS.take 2 gz) of
    [0x1f, 0x8b] -> pure ()
    other -> do
      Hedgehog.annotate ("bad gzip header: " <> show other)
      Hedgehog.failure

prop_defaultProfileMetaRoundTrips ::
  Property
prop_defaultProfileMetaRoundTrips =
  withTests 1 . property $ do
    let (_, profile) = runBuilder defaultProfileMeta (pure ())
        bs = PL.encodeMessage profile
    case decodeProfile bs of
      Left e -> do
        Hedgehog.annotate e
        Hedgehog.failure
      Right decoded ->
        decoded === profile
