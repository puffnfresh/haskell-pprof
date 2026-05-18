{- This file was auto-generated from pprof/profile.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Pprof.Profile_Fields where
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens as Data.ProtoLens
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes as Data.ProtoLens.Encoding.Bytes
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing as Data.ProtoLens.Encoding.Growing
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum as Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2 as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8 as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read
address ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "address" a) =>
  Lens.Family2.LensLike' f s a
address = Data.ProtoLens.Field.field @"address"
buildId ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "buildId" a) =>
  Lens.Family2.LensLike' f s a
buildId = Data.ProtoLens.Field.field @"buildId"
column ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "column" a) =>
  Lens.Family2.LensLike' f s a
column = Data.ProtoLens.Field.field @"column"
comment ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "comment" a) =>
  Lens.Family2.LensLike' f s a
comment = Data.ProtoLens.Field.field @"comment"
defaultSampleType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "defaultSampleType" a) =>
  Lens.Family2.LensLike' f s a
defaultSampleType = Data.ProtoLens.Field.field @"defaultSampleType"
docUrl ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "docUrl" a) =>
  Lens.Family2.LensLike' f s a
docUrl = Data.ProtoLens.Field.field @"docUrl"
dropFrames ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "dropFrames" a) =>
  Lens.Family2.LensLike' f s a
dropFrames = Data.ProtoLens.Field.field @"dropFrames"
durationNanos ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "durationNanos" a) =>
  Lens.Family2.LensLike' f s a
durationNanos = Data.ProtoLens.Field.field @"durationNanos"
fileOffset ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fileOffset" a) =>
  Lens.Family2.LensLike' f s a
fileOffset = Data.ProtoLens.Field.field @"fileOffset"
filename ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "filename" a) =>
  Lens.Family2.LensLike' f s a
filename = Data.ProtoLens.Field.field @"filename"
function ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "function" a) =>
  Lens.Family2.LensLike' f s a
function = Data.ProtoLens.Field.field @"function"
functionId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "functionId" a) =>
  Lens.Family2.LensLike' f s a
functionId = Data.ProtoLens.Field.field @"functionId"
hasFilenames ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hasFilenames" a) =>
  Lens.Family2.LensLike' f s a
hasFilenames = Data.ProtoLens.Field.field @"hasFilenames"
hasFunctions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hasFunctions" a) =>
  Lens.Family2.LensLike' f s a
hasFunctions = Data.ProtoLens.Field.field @"hasFunctions"
hasInlineFrames ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hasInlineFrames" a) =>
  Lens.Family2.LensLike' f s a
hasInlineFrames = Data.ProtoLens.Field.field @"hasInlineFrames"
hasLineNumbers ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hasLineNumbers" a) =>
  Lens.Family2.LensLike' f s a
hasLineNumbers = Data.ProtoLens.Field.field @"hasLineNumbers"
id ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "id" a) =>
  Lens.Family2.LensLike' f s a
id = Data.ProtoLens.Field.field @"id"
isFolded ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "isFolded" a) =>
  Lens.Family2.LensLike' f s a
isFolded = Data.ProtoLens.Field.field @"isFolded"
keepFrames ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "keepFrames" a) =>
  Lens.Family2.LensLike' f s a
keepFrames = Data.ProtoLens.Field.field @"keepFrames"
key ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "key" a) =>
  Lens.Family2.LensLike' f s a
key = Data.ProtoLens.Field.field @"key"
label ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "label" a) =>
  Lens.Family2.LensLike' f s a
label = Data.ProtoLens.Field.field @"label"
line ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "line" a) =>
  Lens.Family2.LensLike' f s a
line = Data.ProtoLens.Field.field @"line"
location ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "location" a) =>
  Lens.Family2.LensLike' f s a
location = Data.ProtoLens.Field.field @"location"
locationId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "locationId" a) =>
  Lens.Family2.LensLike' f s a
locationId = Data.ProtoLens.Field.field @"locationId"
mapping ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "mapping" a) =>
  Lens.Family2.LensLike' f s a
mapping = Data.ProtoLens.Field.field @"mapping"
mappingId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "mappingId" a) =>
  Lens.Family2.LensLike' f s a
mappingId = Data.ProtoLens.Field.field @"mappingId"
maybe'periodType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'periodType" a) =>
  Lens.Family2.LensLike' f s a
maybe'periodType = Data.ProtoLens.Field.field @"maybe'periodType"
memoryLimit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "memoryLimit" a) =>
  Lens.Family2.LensLike' f s a
memoryLimit = Data.ProtoLens.Field.field @"memoryLimit"
memoryStart ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "memoryStart" a) =>
  Lens.Family2.LensLike' f s a
memoryStart = Data.ProtoLens.Field.field @"memoryStart"
name ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "name" a) =>
  Lens.Family2.LensLike' f s a
name = Data.ProtoLens.Field.field @"name"
num ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "num" a) =>
  Lens.Family2.LensLike' f s a
num = Data.ProtoLens.Field.field @"num"
numUnit ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "numUnit" a) =>
  Lens.Family2.LensLike' f s a
numUnit = Data.ProtoLens.Field.field @"numUnit"
period ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "period" a) =>
  Lens.Family2.LensLike' f s a
period = Data.ProtoLens.Field.field @"period"
periodType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "periodType" a) =>
  Lens.Family2.LensLike' f s a
periodType = Data.ProtoLens.Field.field @"periodType"
sample ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "sample" a) =>
  Lens.Family2.LensLike' f s a
sample = Data.ProtoLens.Field.field @"sample"
sampleType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sampleType" a) =>
  Lens.Family2.LensLike' f s a
sampleType = Data.ProtoLens.Field.field @"sampleType"
startLine ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "startLine" a) =>
  Lens.Family2.LensLike' f s a
startLine = Data.ProtoLens.Field.field @"startLine"
str ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "str" a) =>
  Lens.Family2.LensLike' f s a
str = Data.ProtoLens.Field.field @"str"
stringTable ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "stringTable" a) =>
  Lens.Family2.LensLike' f s a
stringTable = Data.ProtoLens.Field.field @"stringTable"
systemName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "systemName" a) =>
  Lens.Family2.LensLike' f s a
systemName = Data.ProtoLens.Field.field @"systemName"
timeNanos ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "timeNanos" a) =>
  Lens.Family2.LensLike' f s a
timeNanos = Data.ProtoLens.Field.field @"timeNanos"
type' ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "type'" a) =>
  Lens.Family2.LensLike' f s a
type' = Data.ProtoLens.Field.field @"type'"
unit ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "unit" a) =>
  Lens.Family2.LensLike' f s a
unit = Data.ProtoLens.Field.field @"unit"
value ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
  Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"
vec'comment ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'comment" a) =>
  Lens.Family2.LensLike' f s a
vec'comment = Data.ProtoLens.Field.field @"vec'comment"
vec'function ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'function" a) =>
  Lens.Family2.LensLike' f s a
vec'function = Data.ProtoLens.Field.field @"vec'function"
vec'label ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'label" a) =>
  Lens.Family2.LensLike' f s a
vec'label = Data.ProtoLens.Field.field @"vec'label"
vec'line ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'line" a) =>
  Lens.Family2.LensLike' f s a
vec'line = Data.ProtoLens.Field.field @"vec'line"
vec'location ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'location" a) =>
  Lens.Family2.LensLike' f s a
vec'location = Data.ProtoLens.Field.field @"vec'location"
vec'locationId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'locationId" a) =>
  Lens.Family2.LensLike' f s a
vec'locationId = Data.ProtoLens.Field.field @"vec'locationId"
vec'mapping ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'mapping" a) =>
  Lens.Family2.LensLike' f s a
vec'mapping = Data.ProtoLens.Field.field @"vec'mapping"
vec'sample ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'sample" a) =>
  Lens.Family2.LensLike' f s a
vec'sample = Data.ProtoLens.Field.field @"vec'sample"
vec'sampleType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'sampleType" a) =>
  Lens.Family2.LensLike' f s a
vec'sampleType = Data.ProtoLens.Field.field @"vec'sampleType"
vec'stringTable ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'stringTable" a) =>
  Lens.Family2.LensLike' f s a
vec'stringTable = Data.ProtoLens.Field.field @"vec'stringTable"
vec'value ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'value" a) =>
  Lens.Family2.LensLike' f s a
vec'value = Data.ProtoLens.Field.field @"vec'value"