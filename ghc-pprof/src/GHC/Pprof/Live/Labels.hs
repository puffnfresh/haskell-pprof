{-# LANGUAGE OverloadedStrings #-}

module GHC.Pprof.Live.Labels
  ( LabelStore,
    newLabelStore,
    withLabels,
    collectLabels,
  )
where

import Control.Concurrent (ThreadId, myThreadId)
import Control.Exception (bracket_)
import Data.IORef (IORef, atomicModifyIORef', newIORef, readIORef)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import Data.Pprof (Label (..))

newtype LabelStore
  = LabelStore (IORef (Map ThreadId [[Label]]))

newLabelStore ::
  IO LabelStore
newLabelStore =
  LabelStore <$> newIORef Map.empty

withLabels ::
  LabelStore ->
  [Label] ->
  IO a ->
  IO a
withLabels (LabelStore ref) labels action = do
  tid <- myThreadId
  let modify f = atomicModifyIORef' ref (\m -> (f m, ()))
  bracket_
    (modify (Map.alter (Just . (labels :) . maybe [] id) tid))
    (modify (Map.update popFrame tid))
    action
  where
    popFrame (_ : rest@(_ : _)) =
      Just rest
    popFrame _ =
      Nothing

collectLabels ::
  LabelStore ->
  ThreadId ->
  IO [Label]
collectLabels (LabelStore ref) tid = do
  m <- readIORef ref
  pure $ maybe [] mergeFrames (Map.lookup tid m)

mergeFrames ::
  [[Label]] ->
  [Label]
mergeFrames =
  Map.elems . foldMap (Map.fromList . map keyed)
  where
    keyed l@(Label k _) =
      (k, l)
