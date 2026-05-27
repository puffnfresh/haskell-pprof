{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module GHC.Pprof.Live.Threads
  ( captureThreadProfile,
  )
where

import Control.Exception (SomeException, try)
import Data.ByteString (ByteString)
import Data.Pprof (Frame (..), ProfileMeta (..), addSample, encodeGzipped)
import qualified Data.Text as T
import GHC.Conc.Sync (ThreadId, listThreads, threadLabel)
import GHC.Pprof.Live.Internal (nowNanos, toFrame)
import GHC.Stack.CloneStack (cloneThreadStack, decode)

captureThreadProfile ::
  IO ByteString
captureThreadProfile = do
  now <- nowNanos
  tids <- listThreads
  stacks <- mapM captureStack tids
  let meta =
        ProfileMeta
          [("goroutine", "count")]
          ("goroutine", "count")
          1
          now
          0
          "goroutine"
      builder =
        mapM_ (\frames -> addSample frames [1] []) stacks
  pure $! snd (encodeGzipped meta builder)

captureStack ::
  ThreadId ->
  IO [Frame]
captureStack tid = do
  mLabel <- threadLabel tid
  let threadName =
        case mLabel of
          Just l -> T.pack l
          Nothing -> T.pack (show tid)
      threadFrame =
        Frame (T.pack "Thread") threadName (T.pack "") 0
  r <- try (cloneThreadStack tid >>= decode)
  pure $ either (\(_ :: SomeException) -> []) (map toFrame) r ++ [threadFrame]
