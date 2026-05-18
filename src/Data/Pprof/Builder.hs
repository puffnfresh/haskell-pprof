module Data.Pprof.Builder
  ( Builder,
    runBuilder,
    addSample,
  )
where

import Control.Applicative (liftA3)
import Control.Monad.Trans.State.Strict
  ( State,
    evalState,
    get,
    modify',
    put,
  )
import Data.Int (Int64)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import Data.Pprof.Types
  ( Frame,
    Label,
    LabelValue (..),
    ProfileMeta,
    frameFilename,
    frameFunction,
    frameLine,
    frameModule,
    labelKey,
    labelValue,
    pmDefaultSampleType,
    pmDurationNanos,
    pmPeriod,
    pmPeriodType,
    pmSampleTypes,
    pmTimeNanos,
  )
import Data.ProtoLens (defMessage)
import Data.ProtoLens.Runtime.Lens.Family2
  ( Lens',
    over,
    set,
    view,
    (&),
    (.~),
    (^.),
  )
import qualified Data.Text as T
import Data.Word (Word64)
import qualified Proto.Pprof.Profile as P
import qualified Proto.Pprof.Profile_Fields as PF

newtype Builder a
  = Builder (State BuilderState a)

unBuilder ::
  Builder a ->
  State BuilderState a
unBuilder (Builder s) =
  s

instance Functor Builder where
  fmap f (Builder s) =
    Builder (fmap f s)

instance Applicative Builder where
  pure =
    Builder . pure
  Builder f <*> Builder x =
    Builder (f <*> x)

instance Monad Builder where
  Builder x >>= k =
    Builder (x >>= unBuilder . k)

data Interner k v i
  = Interner
      !(Map k i)
      ![v]
      !i

internerEntries ::
  Lens' (Interner k v i) [v]
internerEntries f (Interner m vs n) =
  (\vs' -> Interner m vs' n) <$> f vs

emptyInterner ::
  (Num i) =>
  Interner k v i
emptyInterner =
  -- From pprof: Function/Location/Mapping ids are reserved at 0
  -- (treated as "unset"), so interned ids start at 1.
  Interner Map.empty [] 1

data BuilderState
  = BuilderState
      !(Interner T.Text T.Text Int64)
      !(Interner FunctionKey P.Function Word64)
      !(Interner LocationKey P.Location Word64)
      ![P.Sample]

bsStrings ::
  Lens' BuilderState (Interner T.Text T.Text Int64)
bsStrings f (BuilderState s fns ls ss) =
  (\s' -> BuilderState s' fns ls ss) <$> f s

bsFunctions ::
  Lens' BuilderState (Interner FunctionKey P.Function Word64)
bsFunctions f (BuilderState s fns ls ss) =
  (\fns' -> BuilderState s fns' ls ss) <$> f fns

bsLocations ::
  Lens' BuilderState (Interner LocationKey P.Location Word64)
bsLocations f (BuilderState s fns ls ss) =
  (\ls' -> BuilderState s fns ls' ss) <$> f ls

bsSamples ::
  Lens' BuilderState [P.Sample]
bsSamples f (BuilderState s fns ls ss) =
  BuilderState s fns ls <$> f ss

data FunctionKey
  = FunctionKey
      !Int64
      !Int64
      !Int64
      !Int64
  deriving (Eq, Ord, Show)

data LocationKey
  = LocationKey
      !Word64
      !Int64
  deriving (Eq, Ord, Show)

emptyState ::
  BuilderState
emptyState =
  BuilderState
    -- From pprof:
    -- string_table[0] must be ''
    (Interner (Map.singleton "" 0) [""] 1)
    emptyInterner
    emptyInterner
    []

internString ::
  T.Text ->
  Builder Int64
internString s = Builder $ do
  st <- get
  let Interner m vs n = view bsStrings st
  case Map.lookup s m of
    Just i -> pure i
    Nothing -> do
      put (set bsStrings (Interner (Map.insert s n m) (s : vs) (n + 1)) st)
      pure n

internFunction ::
  Frame ->
  Builder Word64
internFunction frame = do
  nameIdx <- internString (qualifiedName frame)
  fileIdx <- internString (frame ^. frameFilename)
  -- systemName and startLine left at 0 ("absent"): Frame does not
  -- carry a separate unmangled name or a function-start line.
  let key = FunctionKey nameIdx 0 fileIdx 0
  Builder $ do
    st <- get
    let Interner m vs n = view bsFunctions st
    case Map.lookup key m of
      Just fid -> pure fid
      Nothing -> do
        let fn = mkFunction n key
        put (set bsFunctions (Interner (Map.insert key n m) (fn : vs) (n + 1)) st)
        pure n

qualifiedName ::
  Frame ->
  T.Text
qualifiedName f =
  T.intercalate "." $ filter (not . T.null) [f ^. frameModule, f ^. frameFunction]

mkFunction ::
  Word64 ->
  FunctionKey ->
  P.Function
mkFunction fid (FunctionKey name systemName filename startLine) =
  defMessage
    & PF.id
    .~ fid
    & PF.name
    .~ name
    & PF.systemName
    .~ systemName
    & PF.filename
    .~ filename
    & PF.startLine
    .~ startLine

internLocation ::
  Frame ->
  Builder Word64
internLocation frame = do
  fid <- internFunction frame
  let key = LocationKey fid (frame ^. frameLine)
  Builder $ do
    st <- get
    let Interner m vs n = view bsLocations st
    case Map.lookup key m of
      Just lid -> pure lid
      Nothing -> do
        let loc = mkLocation n key
        put (set bsLocations (Interner (Map.insert key n m) (loc : vs) (n + 1)) st)
        pure n

mkLocation ::
  Word64 ->
  LocationKey ->
  P.Location
mkLocation lid k =
  defMessage
    & PF.id
    .~ lid
    -- Refers to syntheticMapping (id 1).
    & PF.mappingId
    .~ 1
    & PF.line
    .~ [mkLine k]

mkLine ::
  LocationKey ->
  P.Line
mkLine (LocationKey fid line) =
  defMessage
    & PF.functionId
    .~ fid
    & PF.line
    .~ line

-- From pprof: every Location must reference a Mapping, but mappings
-- are optional for symbolicated locations (see google/pprof
-- proto/README.md). Convention is one placeholder Mapping with
-- hasFunctions=True so tools know frames are already symbolicated and
-- skip binary lookup. Used by emitters of symbolicated profiles such
-- as Grafana Pyroscope's language agents (Python, Ruby, .NET, PHP,
-- Node, Rust) and async-profiler's JFR-to-pprof converter.
syntheticMapping ::
  P.Mapping
syntheticMapping =
  defMessage
    & PF.id
    .~ 1
    & PF.hasFunctions
    .~ True

internLabel ::
  Label ->
  Builder P.Label
internLabel l = do
  kIdx <- internString (l ^. labelKey)
  case l ^. labelValue of
    LabelString s -> do
      sIdx <- internString s
      pure $
        defMessage
          & PF.key
          .~ kIdx
          & PF.str
          .~ sIdx
    LabelNumber n unit -> do
      uIdx <- internString unit
      pure $
        defMessage
          & PF.key
          .~ kIdx
          & PF.num
          .~ n
          & PF.numUnit
          .~ uIdx

addSample ::
  [Frame] ->
  [Int64] ->
  [Label] ->
  Builder ()
addSample frames values labels = do
  locIds <- mapM internLocation frames
  labelProtos <- mapM internLabel labels
  let sample =
        defMessage
          & PF.locationId
          .~ locIds
          & PF.value
          .~ values
          & PF.label
          .~ labelProtos
  Builder $ modify' (over bsSamples (sample :))

internValueType ::
  (T.Text, T.Text) ->
  Builder P.ValueType
internValueType (t, u) = do
  tIdx <- internString t
  uIdx <- internString u
  pure $
    defMessage
      & PF.type'
      .~ tIdx
      & PF.unit
      .~ uIdx

runBuilder ::
  ProfileMeta ->
  Builder a ->
  (a, P.Profile)
runBuilder meta body =
  evalState (unBuilder (liftA2 (,) body profile)) emptyState
  where
    profile =
      liftA3
        (assembleProfile meta)
        (mapM internValueType (meta ^. pmSampleTypes))
        (internValueType (meta ^. pmPeriodType))
        (internString (meta ^. pmDefaultSampleType))
        <*> Builder get

assembleProfile ::
  ProfileMeta ->
  [P.ValueType] ->
  P.ValueType ->
  Int64 ->
  BuilderState ->
  P.Profile
assembleProfile meta sampleTypes periodType defaultSampleIdx st =
  defMessage
    & PF.sampleType
    .~ sampleTypes
    & PF.sample
    .~ reverse (view bsSamples st)
    & PF.mapping
    .~ [syntheticMapping]
    & PF.location
    .~ reverse (view (bsLocations . internerEntries) st)
    & PF.function
    .~ reverse (view (bsFunctions . internerEntries) st)
    & PF.stringTable
    .~ reverse (view (bsStrings . internerEntries) st)
    & PF.timeNanos
    .~ (meta ^. pmTimeNanos)
    & PF.durationNanos
    .~ (meta ^. pmDurationNanos)
    & PF.periodType
    .~ periodType
    & PF.period
    .~ (meta ^. pmPeriod)
    & PF.defaultSampleType
    .~ defaultSampleIdx
