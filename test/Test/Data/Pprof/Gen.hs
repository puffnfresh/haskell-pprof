module Test.Data.Pprof.Gen
  ( genFrame,
    genStack,
    genLabel,
    genValues,
    genSampleEntry,
    genMeta,
    SampleEntry (..),
    seStack,
    seValues,
    seLabels,
  )
where

import Control.Applicative (liftA3)
import Data.Int (Int64)
import Data.Pprof.Types
import Data.ProtoLens.Runtime.Lens.Family2 (Lens')
import Data.Text (Text)
import Hedgehog (Gen)
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range

data SampleEntry
  = SampleEntry
      ![Frame]
      ![Int64]
      ![Label]
  deriving (Eq, Show)

seStack ::
  Lens' SampleEntry [Frame]
seStack f (SampleEntry s v l) =
  (\s' -> SampleEntry s' v l) <$> f s

seValues ::
  Lens' SampleEntry [Int64]
seValues f (SampleEntry s v l) =
  (\v' -> SampleEntry s v' l) <$> f v

seLabels ::
  Lens' SampleEntry [Label]
seLabels f (SampleEntry s v l) =
  SampleEntry s v <$> f l

textShort ::
  Gen Text
textShort = Gen.text (Range.linear 1 8) Gen.alphaNum

textMaybeEmpty ::
  Gen Text
textMaybeEmpty = Gen.text (Range.linear 0 8) Gen.alphaNum

genFrame ::
  Gen Frame
genFrame =
  liftA3
    Frame
    textShort
    textShort
    textMaybeEmpty
    <*> Gen.int64 (Range.linear 0 1000)

genStack ::
  Gen [Frame]
genStack = Gen.list (Range.linear 1 8) genFrame

genLabel ::
  Gen Label
genLabel =
  liftA2
    Label
    textShort
    ( Gen.choice
        [ fmap LabelString textMaybeEmpty,
          liftA2
            LabelNumber
            (Gen.int64 (Range.linear 0 100000))
            textShort
        ]
    )

genValues ::
  Int -> Gen [Int64]
genValues n = Gen.list (Range.singleton n) (Gen.int64 (Range.linear 0 100000))

genSampleEntry ::
  Int -> Gen SampleEntry
genSampleEntry valueArity =
  liftA3
    SampleEntry
    genStack
    (genValues valueArity)
    (Gen.list (Range.linear 0 3) genLabel)

genMeta ::
  Gen ProfileMeta
genMeta = do
  arity <- Gen.int (Range.linear 1 3)
  sampleTypes <- Gen.list (Range.singleton arity) (liftA2 (,) textShort textShort)
  periodType <- liftA2 (,) textShort textShort
  period <- Gen.int64 (Range.linear 0 1000000)
  timeNanos <- Gen.int64 (Range.linear 0 2000000000000000000)
  durationNanos <- Gen.int64 (Range.linear 0 60000000000)
  defaultSampleType <-
    Gen.frequency
      [ (1, pure ""),
        (3, Gen.element (map fst sampleTypes))
      ]
  pure $
    ProfileMeta
      sampleTypes
      periodType
      period
      timeNanos
      durationNanos
      defaultSampleType
