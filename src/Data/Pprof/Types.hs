module Data.Pprof.Types
  ( Frame (..),
    frameModule,
    frameFunction,
    frameFilename,
    frameLine,
    Label (..),
    labelKey,
    labelValue,
    LabelValue (..),
    ProfileMeta (..),
    pmSampleTypes,
    pmPeriodType,
    pmPeriod,
    pmTimeNanos,
    pmDurationNanos,
    pmDefaultSampleType,
    defaultProfileMeta,
  )
where

import Data.Int (Int64)
import Data.ProtoLens.Runtime.Lens.Family2 (Lens')
import Data.Text (Text)

data Frame
  = Frame
      !Text
      !Text
      !Text
      !Int64
  deriving (Eq, Ord, Show)

frameModule ::
  Lens' Frame Text
frameModule f (Frame m fn fp l) =
  (\m' -> Frame m' fn fp l) <$> f m

frameFunction ::
  Lens' Frame Text
frameFunction f (Frame m fn fp l) =
  (\fn' -> Frame m fn' fp l) <$> f fn

frameFilename ::
  Lens' Frame Text
frameFilename f (Frame m fn fp l) =
  (\fp' -> Frame m fn fp' l) <$> f fp

frameLine ::
  Lens' Frame Int64
frameLine f (Frame m fn fp l) =
  Frame m fn fp <$> f l

data Label
  = Label
      !Text
      !LabelValue
  deriving (Eq, Ord, Show)

labelKey ::
  Lens' Label Text
labelKey f (Label k v) =
  (\k' -> Label k' v) <$> f k

labelValue ::
  Lens' Label LabelValue
labelValue f (Label k v) =
  Label k <$> f v

data LabelValue
  = LabelString !Text
  | LabelNumber !Int64 !Text
  deriving (Eq, Ord, Show)

data ProfileMeta
  = ProfileMeta
      ![(Text, Text)]
      !(Text, Text)
      !Int64
      !Int64
      !Int64
      !Text
  deriving (Eq, Ord, Show)

pmSampleTypes ::
  Lens' ProfileMeta [(Text, Text)]
pmSampleTypes f (ProfileMeta st pt p t d dst) =
  (\st' -> ProfileMeta st' pt p t d dst) <$> f st

pmPeriodType ::
  Lens' ProfileMeta (Text, Text)
pmPeriodType f (ProfileMeta st pt p t d dst) =
  (\pt' -> ProfileMeta st pt' p t d dst) <$> f pt

pmPeriod ::
  Lens' ProfileMeta Int64
pmPeriod f (ProfileMeta st pt p t d dst) =
  (\p' -> ProfileMeta st pt p' t d dst) <$> f p

pmTimeNanos ::
  Lens' ProfileMeta Int64
pmTimeNanos f (ProfileMeta st pt p t d dst) =
  (\t' -> ProfileMeta st pt p t' d dst) <$> f t

pmDurationNanos ::
  Lens' ProfileMeta Int64
pmDurationNanos f (ProfileMeta st pt p t d dst) =
  (\d' -> ProfileMeta st pt p t d' dst) <$> f d

pmDefaultSampleType ::
  Lens' ProfileMeta Text
pmDefaultSampleType f (ProfileMeta st pt p t d dst) =
  ProfileMeta st pt p t d <$> f dst

defaultProfileMeta ::
  ProfileMeta
defaultProfileMeta =
  ProfileMeta [] ("", "") 0 0 0 ""
