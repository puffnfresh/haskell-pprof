{- This file was auto-generated from pprof/profile.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Pprof.Profile (
        Function(), Label(), Line(), Location(), Mapping(), Profile(),
        Sample(), ValueType()
    ) where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism as Data.ProtoLens.Prism
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
{- | Fields :
     
         * 'Proto.Pprof.Profile_Fields.id' @:: Lens' Function Data.Word.Word64@
         * 'Proto.Pprof.Profile_Fields.name' @:: Lens' Function Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.systemName' @:: Lens' Function Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.filename' @:: Lens' Function Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.startLine' @:: Lens' Function Data.Int.Int64@ -}
data Function
  = Function'_constructor {_Function'id :: !Data.Word.Word64,
                           _Function'name :: !Data.Int.Int64,
                           _Function'systemName :: !Data.Int.Int64,
                           _Function'filename :: !Data.Int.Int64,
                           _Function'startLine :: !Data.Int.Int64,
                           _Function'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Function where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Function "id" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Function'id (\ x__ y__ -> x__ {_Function'id = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Function "name" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Function'name (\ x__ y__ -> x__ {_Function'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Function "systemName" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Function'systemName
           (\ x__ y__ -> x__ {_Function'systemName = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Function "filename" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Function'filename (\ x__ y__ -> x__ {_Function'filename = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Function "startLine" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Function'startLine (\ x__ y__ -> x__ {_Function'startLine = y__}))
        Prelude.id
instance Data.ProtoLens.Message Function where
  messageName _ = Data.Text.pack "perftools.profiles.Function"
  packedMessageDescriptor _
    = "\n\
      \\bFunction\DC2\SO\n\
      \\STXid\CAN\SOH \SOH(\EOTR\STXid\DC2\DC2\n\
      \\EOTname\CAN\STX \SOH(\ETXR\EOTname\DC2\US\n\
      \\vsystem_name\CAN\ETX \SOH(\ETXR\n\
      \systemName\DC2\SUB\n\
      \\bfilename\CAN\EOT \SOH(\ETXR\bfilename\DC2\GS\n\
      \\n\
      \start_line\CAN\ENQ \SOH(\ETXR\tstartLine"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        id__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"id")) ::
              Data.ProtoLens.FieldDescriptor Function
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Function
        systemName__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "system_name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"systemName")) ::
              Data.ProtoLens.FieldDescriptor Function
        filename__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "filename"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"filename")) ::
              Data.ProtoLens.FieldDescriptor Function
        startLine__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "start_line"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"startLine")) ::
              Data.ProtoLens.FieldDescriptor Function
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, id__field_descriptor),
           (Data.ProtoLens.Tag 2, name__field_descriptor),
           (Data.ProtoLens.Tag 3, systemName__field_descriptor),
           (Data.ProtoLens.Tag 4, filename__field_descriptor),
           (Data.ProtoLens.Tag 5, startLine__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Function'_unknownFields
        (\ x__ y__ -> x__ {_Function'_unknownFields = y__})
  defMessage
    = Function'_constructor
        {_Function'id = Data.ProtoLens.fieldDefault,
         _Function'name = Data.ProtoLens.fieldDefault,
         _Function'systemName = Data.ProtoLens.fieldDefault,
         _Function'filename = Data.ProtoLens.fieldDefault,
         _Function'startLine = Data.ProtoLens.fieldDefault,
         _Function'_unknownFields = []}
  parseMessage
    = let
        loop :: Function -> Data.ProtoLens.Encoding.Bytes.Parser Function
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "id"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"id") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "system_name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"systemName") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "filename"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"filename") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "start_line"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"startLine") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Function"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"id") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"systemName") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"filename") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      ((Data.Monoid.<>)
                         (let
                            _v = Lens.Family2.view (Data.ProtoLens.Field.field @"startLine") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                     _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData Function where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Function'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Function'id x__)
                (Control.DeepSeq.deepseq
                   (_Function'name x__)
                   (Control.DeepSeq.deepseq
                      (_Function'systemName x__)
                      (Control.DeepSeq.deepseq
                         (_Function'filename x__)
                         (Control.DeepSeq.deepseq (_Function'startLine x__) ())))))
{- | Fields :
     
         * 'Proto.Pprof.Profile_Fields.key' @:: Lens' Label Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.str' @:: Lens' Label Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.num' @:: Lens' Label Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.numUnit' @:: Lens' Label Data.Int.Int64@ -}
data Label
  = Label'_constructor {_Label'key :: !Data.Int.Int64,
                        _Label'str :: !Data.Int.Int64,
                        _Label'num :: !Data.Int.Int64,
                        _Label'numUnit :: !Data.Int.Int64,
                        _Label'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Label where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Label "key" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Label'key (\ x__ y__ -> x__ {_Label'key = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Label "str" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Label'str (\ x__ y__ -> x__ {_Label'str = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Label "num" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Label'num (\ x__ y__ -> x__ {_Label'num = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Label "numUnit" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Label'numUnit (\ x__ y__ -> x__ {_Label'numUnit = y__}))
        Prelude.id
instance Data.ProtoLens.Message Label where
  messageName _ = Data.Text.pack "perftools.profiles.Label"
  packedMessageDescriptor _
    = "\n\
      \\ENQLabel\DC2\DLE\n\
      \\ETXkey\CAN\SOH \SOH(\ETXR\ETXkey\DC2\DLE\n\
      \\ETXstr\CAN\STX \SOH(\ETXR\ETXstr\DC2\DLE\n\
      \\ETXnum\CAN\ETX \SOH(\ETXR\ETXnum\DC2\EM\n\
      \\bnum_unit\CAN\EOT \SOH(\ETXR\anumUnit"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        key__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"key")) ::
              Data.ProtoLens.FieldDescriptor Label
        str__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "str"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"str")) ::
              Data.ProtoLens.FieldDescriptor Label
        num__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "num"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"num")) ::
              Data.ProtoLens.FieldDescriptor Label
        numUnit__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "num_unit"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"numUnit")) ::
              Data.ProtoLens.FieldDescriptor Label
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, key__field_descriptor),
           (Data.ProtoLens.Tag 2, str__field_descriptor),
           (Data.ProtoLens.Tag 3, num__field_descriptor),
           (Data.ProtoLens.Tag 4, numUnit__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Label'_unknownFields
        (\ x__ y__ -> x__ {_Label'_unknownFields = y__})
  defMessage
    = Label'_constructor
        {_Label'key = Data.ProtoLens.fieldDefault,
         _Label'str = Data.ProtoLens.fieldDefault,
         _Label'num = Data.ProtoLens.fieldDefault,
         _Label'numUnit = Data.ProtoLens.fieldDefault,
         _Label'_unknownFields = []}
  parseMessage
    = let
        loop :: Label -> Data.ProtoLens.Encoding.Bytes.Parser Label
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "key"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"key") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "str"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"str") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "num"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"num") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "num_unit"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"numUnit") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Label"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"key") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"str") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"num") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"numUnit") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData Label where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Label'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Label'key x__)
                (Control.DeepSeq.deepseq
                   (_Label'str x__)
                   (Control.DeepSeq.deepseq
                      (_Label'num x__)
                      (Control.DeepSeq.deepseq (_Label'numUnit x__) ()))))
{- | Fields :
     
         * 'Proto.Pprof.Profile_Fields.functionId' @:: Lens' Line Data.Word.Word64@
         * 'Proto.Pprof.Profile_Fields.line' @:: Lens' Line Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.column' @:: Lens' Line Data.Int.Int64@ -}
data Line
  = Line'_constructor {_Line'functionId :: !Data.Word.Word64,
                       _Line'line :: !Data.Int.Int64,
                       _Line'column :: !Data.Int.Int64,
                       _Line'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Line where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Line "functionId" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Line'functionId (\ x__ y__ -> x__ {_Line'functionId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Line "line" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Line'line (\ x__ y__ -> x__ {_Line'line = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Line "column" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Line'column (\ x__ y__ -> x__ {_Line'column = y__}))
        Prelude.id
instance Data.ProtoLens.Message Line where
  messageName _ = Data.Text.pack "perftools.profiles.Line"
  packedMessageDescriptor _
    = "\n\
      \\EOTLine\DC2\US\n\
      \\vfunction_id\CAN\SOH \SOH(\EOTR\n\
      \functionId\DC2\DC2\n\
      \\EOTline\CAN\STX \SOH(\ETXR\EOTline\DC2\SYN\n\
      \\ACKcolumn\CAN\ETX \SOH(\ETXR\ACKcolumn"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        functionId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "function_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"functionId")) ::
              Data.ProtoLens.FieldDescriptor Line
        line__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "line"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"line")) ::
              Data.ProtoLens.FieldDescriptor Line
        column__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "column"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"column")) ::
              Data.ProtoLens.FieldDescriptor Line
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, functionId__field_descriptor),
           (Data.ProtoLens.Tag 2, line__field_descriptor),
           (Data.ProtoLens.Tag 3, column__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Line'_unknownFields
        (\ x__ y__ -> x__ {_Line'_unknownFields = y__})
  defMessage
    = Line'_constructor
        {_Line'functionId = Data.ProtoLens.fieldDefault,
         _Line'line = Data.ProtoLens.fieldDefault,
         _Line'column = Data.ProtoLens.fieldDefault,
         _Line'_unknownFields = []}
  parseMessage
    = let
        loop :: Line -> Data.ProtoLens.Encoding.Bytes.Parser Line
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "function_id"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"functionId") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "line"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"line") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "column"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"column") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Line"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"functionId") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"line") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"column") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Line where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Line'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Line'functionId x__)
                (Control.DeepSeq.deepseq
                   (_Line'line x__) (Control.DeepSeq.deepseq (_Line'column x__) ())))
{- | Fields :
     
         * 'Proto.Pprof.Profile_Fields.id' @:: Lens' Location Data.Word.Word64@
         * 'Proto.Pprof.Profile_Fields.mappingId' @:: Lens' Location Data.Word.Word64@
         * 'Proto.Pprof.Profile_Fields.address' @:: Lens' Location Data.Word.Word64@
         * 'Proto.Pprof.Profile_Fields.line' @:: Lens' Location [Line]@
         * 'Proto.Pprof.Profile_Fields.vec'line' @:: Lens' Location (Data.Vector.Vector Line)@
         * 'Proto.Pprof.Profile_Fields.isFolded' @:: Lens' Location Prelude.Bool@ -}
data Location
  = Location'_constructor {_Location'id :: !Data.Word.Word64,
                           _Location'mappingId :: !Data.Word.Word64,
                           _Location'address :: !Data.Word.Word64,
                           _Location'line :: !(Data.Vector.Vector Line),
                           _Location'isFolded :: !Prelude.Bool,
                           _Location'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Location where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Location "id" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Location'id (\ x__ y__ -> x__ {_Location'id = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Location "mappingId" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Location'mappingId (\ x__ y__ -> x__ {_Location'mappingId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Location "address" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Location'address (\ x__ y__ -> x__ {_Location'address = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Location "line" [Line] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Location'line (\ x__ y__ -> x__ {_Location'line = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Location "vec'line" (Data.Vector.Vector Line) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Location'line (\ x__ y__ -> x__ {_Location'line = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Location "isFolded" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Location'isFolded (\ x__ y__ -> x__ {_Location'isFolded = y__}))
        Prelude.id
instance Data.ProtoLens.Message Location where
  messageName _ = Data.Text.pack "perftools.profiles.Location"
  packedMessageDescriptor _
    = "\n\
      \\bLocation\DC2\SO\n\
      \\STXid\CAN\SOH \SOH(\EOTR\STXid\DC2\GS\n\
      \\n\
      \mapping_id\CAN\STX \SOH(\EOTR\tmappingId\DC2\CAN\n\
      \\aaddress\CAN\ETX \SOH(\EOTR\aaddress\DC2,\n\
      \\EOTline\CAN\EOT \ETX(\v2\CAN.perftools.profiles.LineR\EOTline\DC2\ESC\n\
      \\tis_folded\CAN\ENQ \SOH(\bR\bisFolded"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        id__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"id")) ::
              Data.ProtoLens.FieldDescriptor Location
        mappingId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "mapping_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"mappingId")) ::
              Data.ProtoLens.FieldDescriptor Location
        address__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "address"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"address")) ::
              Data.ProtoLens.FieldDescriptor Location
        line__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "line"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Line)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"line")) ::
              Data.ProtoLens.FieldDescriptor Location
        isFolded__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "is_folded"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"isFolded")) ::
              Data.ProtoLens.FieldDescriptor Location
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, id__field_descriptor),
           (Data.ProtoLens.Tag 2, mappingId__field_descriptor),
           (Data.ProtoLens.Tag 3, address__field_descriptor),
           (Data.ProtoLens.Tag 4, line__field_descriptor),
           (Data.ProtoLens.Tag 5, isFolded__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Location'_unknownFields
        (\ x__ y__ -> x__ {_Location'_unknownFields = y__})
  defMessage
    = Location'_constructor
        {_Location'id = Data.ProtoLens.fieldDefault,
         _Location'mappingId = Data.ProtoLens.fieldDefault,
         _Location'address = Data.ProtoLens.fieldDefault,
         _Location'line = Data.Vector.Generic.empty,
         _Location'isFolded = Data.ProtoLens.fieldDefault,
         _Location'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Location
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Line
             -> Data.ProtoLens.Encoding.Bytes.Parser Location
        loop x mutable'line
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'line <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'line)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'line") frozen'line x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "id"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"id") y x)
                                  mutable'line
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "mapping_id"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"mappingId") y x)
                                  mutable'line
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "address"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"address") y x)
                                  mutable'line
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "line"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'line y)
                                loop x v
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "is_folded"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"isFolded") y x)
                                  mutable'line
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'line
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'line <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'line)
          "Location"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"id") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"mappingId") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"address") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'line") _x))
                      ((Data.Monoid.<>)
                         (let
                            _v = Lens.Family2.view (Data.ProtoLens.Field.field @"isFolded") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (\ b -> if b then 1 else 0) _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData Location where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Location'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Location'id x__)
                (Control.DeepSeq.deepseq
                   (_Location'mappingId x__)
                   (Control.DeepSeq.deepseq
                      (_Location'address x__)
                      (Control.DeepSeq.deepseq
                         (_Location'line x__)
                         (Control.DeepSeq.deepseq (_Location'isFolded x__) ())))))
{- | Fields :
     
         * 'Proto.Pprof.Profile_Fields.id' @:: Lens' Mapping Data.Word.Word64@
         * 'Proto.Pprof.Profile_Fields.memoryStart' @:: Lens' Mapping Data.Word.Word64@
         * 'Proto.Pprof.Profile_Fields.memoryLimit' @:: Lens' Mapping Data.Word.Word64@
         * 'Proto.Pprof.Profile_Fields.fileOffset' @:: Lens' Mapping Data.Word.Word64@
         * 'Proto.Pprof.Profile_Fields.filename' @:: Lens' Mapping Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.buildId' @:: Lens' Mapping Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.hasFunctions' @:: Lens' Mapping Prelude.Bool@
         * 'Proto.Pprof.Profile_Fields.hasFilenames' @:: Lens' Mapping Prelude.Bool@
         * 'Proto.Pprof.Profile_Fields.hasLineNumbers' @:: Lens' Mapping Prelude.Bool@
         * 'Proto.Pprof.Profile_Fields.hasInlineFrames' @:: Lens' Mapping Prelude.Bool@ -}
data Mapping
  = Mapping'_constructor {_Mapping'id :: !Data.Word.Word64,
                          _Mapping'memoryStart :: !Data.Word.Word64,
                          _Mapping'memoryLimit :: !Data.Word.Word64,
                          _Mapping'fileOffset :: !Data.Word.Word64,
                          _Mapping'filename :: !Data.Int.Int64,
                          _Mapping'buildId :: !Data.Int.Int64,
                          _Mapping'hasFunctions :: !Prelude.Bool,
                          _Mapping'hasFilenames :: !Prelude.Bool,
                          _Mapping'hasLineNumbers :: !Prelude.Bool,
                          _Mapping'hasInlineFrames :: !Prelude.Bool,
                          _Mapping'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Mapping where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Mapping "id" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mapping'id (\ x__ y__ -> x__ {_Mapping'id = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Mapping "memoryStart" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mapping'memoryStart
           (\ x__ y__ -> x__ {_Mapping'memoryStart = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Mapping "memoryLimit" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mapping'memoryLimit
           (\ x__ y__ -> x__ {_Mapping'memoryLimit = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Mapping "fileOffset" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mapping'fileOffset (\ x__ y__ -> x__ {_Mapping'fileOffset = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Mapping "filename" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mapping'filename (\ x__ y__ -> x__ {_Mapping'filename = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Mapping "buildId" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mapping'buildId (\ x__ y__ -> x__ {_Mapping'buildId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Mapping "hasFunctions" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mapping'hasFunctions
           (\ x__ y__ -> x__ {_Mapping'hasFunctions = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Mapping "hasFilenames" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mapping'hasFilenames
           (\ x__ y__ -> x__ {_Mapping'hasFilenames = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Mapping "hasLineNumbers" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mapping'hasLineNumbers
           (\ x__ y__ -> x__ {_Mapping'hasLineNumbers = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Mapping "hasInlineFrames" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mapping'hasInlineFrames
           (\ x__ y__ -> x__ {_Mapping'hasInlineFrames = y__}))
        Prelude.id
instance Data.ProtoLens.Message Mapping where
  messageName _ = Data.Text.pack "perftools.profiles.Mapping"
  packedMessageDescriptor _
    = "\n\
      \\aMapping\DC2\SO\n\
      \\STXid\CAN\SOH \SOH(\EOTR\STXid\DC2!\n\
      \\fmemory_start\CAN\STX \SOH(\EOTR\vmemoryStart\DC2!\n\
      \\fmemory_limit\CAN\ETX \SOH(\EOTR\vmemoryLimit\DC2\US\n\
      \\vfile_offset\CAN\EOT \SOH(\EOTR\n\
      \fileOffset\DC2\SUB\n\
      \\bfilename\CAN\ENQ \SOH(\ETXR\bfilename\DC2\EM\n\
      \\bbuild_id\CAN\ACK \SOH(\ETXR\abuildId\DC2#\n\
      \\rhas_functions\CAN\a \SOH(\bR\fhasFunctions\DC2#\n\
      \\rhas_filenames\CAN\b \SOH(\bR\fhasFilenames\DC2(\n\
      \\DLEhas_line_numbers\CAN\t \SOH(\bR\SOhasLineNumbers\DC2*\n\
      \\DC1has_inline_frames\CAN\n\
      \ \SOH(\bR\SIhasInlineFrames"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        id__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"id")) ::
              Data.ProtoLens.FieldDescriptor Mapping
        memoryStart__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "memory_start"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"memoryStart")) ::
              Data.ProtoLens.FieldDescriptor Mapping
        memoryLimit__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "memory_limit"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"memoryLimit")) ::
              Data.ProtoLens.FieldDescriptor Mapping
        fileOffset__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "file_offset"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"fileOffset")) ::
              Data.ProtoLens.FieldDescriptor Mapping
        filename__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "filename"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"filename")) ::
              Data.ProtoLens.FieldDescriptor Mapping
        buildId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "build_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"buildId")) ::
              Data.ProtoLens.FieldDescriptor Mapping
        hasFunctions__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "has_functions"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"hasFunctions")) ::
              Data.ProtoLens.FieldDescriptor Mapping
        hasFilenames__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "has_filenames"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"hasFilenames")) ::
              Data.ProtoLens.FieldDescriptor Mapping
        hasLineNumbers__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "has_line_numbers"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"hasLineNumbers")) ::
              Data.ProtoLens.FieldDescriptor Mapping
        hasInlineFrames__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "has_inline_frames"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"hasInlineFrames")) ::
              Data.ProtoLens.FieldDescriptor Mapping
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, id__field_descriptor),
           (Data.ProtoLens.Tag 2, memoryStart__field_descriptor),
           (Data.ProtoLens.Tag 3, memoryLimit__field_descriptor),
           (Data.ProtoLens.Tag 4, fileOffset__field_descriptor),
           (Data.ProtoLens.Tag 5, filename__field_descriptor),
           (Data.ProtoLens.Tag 6, buildId__field_descriptor),
           (Data.ProtoLens.Tag 7, hasFunctions__field_descriptor),
           (Data.ProtoLens.Tag 8, hasFilenames__field_descriptor),
           (Data.ProtoLens.Tag 9, hasLineNumbers__field_descriptor),
           (Data.ProtoLens.Tag 10, hasInlineFrames__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Mapping'_unknownFields
        (\ x__ y__ -> x__ {_Mapping'_unknownFields = y__})
  defMessage
    = Mapping'_constructor
        {_Mapping'id = Data.ProtoLens.fieldDefault,
         _Mapping'memoryStart = Data.ProtoLens.fieldDefault,
         _Mapping'memoryLimit = Data.ProtoLens.fieldDefault,
         _Mapping'fileOffset = Data.ProtoLens.fieldDefault,
         _Mapping'filename = Data.ProtoLens.fieldDefault,
         _Mapping'buildId = Data.ProtoLens.fieldDefault,
         _Mapping'hasFunctions = Data.ProtoLens.fieldDefault,
         _Mapping'hasFilenames = Data.ProtoLens.fieldDefault,
         _Mapping'hasLineNumbers = Data.ProtoLens.fieldDefault,
         _Mapping'hasInlineFrames = Data.ProtoLens.fieldDefault,
         _Mapping'_unknownFields = []}
  parseMessage
    = let
        loop :: Mapping -> Data.ProtoLens.Encoding.Bytes.Parser Mapping
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "id"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"id") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "memory_start"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"memoryStart") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "memory_limit"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"memoryLimit") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "file_offset"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"fileOffset") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "filename"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"filename") y x)
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "build_id"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"buildId") y x)
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "has_functions"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"hasFunctions") y x)
                        64
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "has_filenames"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"hasFilenames") y x)
                        72
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "has_line_numbers"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"hasLineNumbers") y x)
                        80
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "has_inline_frames"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"hasInlineFrames") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Mapping"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"id") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"memoryStart") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"memoryLimit") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view (Data.ProtoLens.Field.field @"fileOffset") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                      ((Data.Monoid.<>)
                         (let
                            _v = Lens.Family2.view (Data.ProtoLens.Field.field @"filename") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                     _v))
                         ((Data.Monoid.<>)
                            (let
                               _v = Lens.Family2.view (Data.ProtoLens.Field.field @"buildId") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                        _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v
                                    = Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"hasFunctions") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                        ((Prelude..)
                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (\ b -> if b then 1 else 0) _v))
                               ((Data.Monoid.<>)
                                  (let
                                     _v
                                       = Lens.Family2.view
                                           (Data.ProtoLens.Field.field @"hasFilenames") _x
                                   in
                                     if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                         Data.Monoid.mempty
                                     else
                                         (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt 64)
                                           ((Prelude..)
                                              Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (\ b -> if b then 1 else 0) _v))
                                  ((Data.Monoid.<>)
                                     (let
                                        _v
                                          = Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"hasLineNumbers") _x
                                      in
                                        if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                            Data.Monoid.mempty
                                        else
                                            (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt 72)
                                              ((Prelude..)
                                                 Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 (\ b -> if b then 1 else 0) _v))
                                     ((Data.Monoid.<>)
                                        (let
                                           _v
                                             = Lens.Family2.view
                                                 (Data.ProtoLens.Field.field @"hasInlineFrames") _x
                                         in
                                           if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                               Data.Monoid.mempty
                                           else
                                               (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 80)
                                                 ((Prelude..)
                                                    Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    (\ b -> if b then 1 else 0) _v))
                                        (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                           (Lens.Family2.view
                                              Data.ProtoLens.unknownFields _x)))))))))))
instance Control.DeepSeq.NFData Mapping where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Mapping'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Mapping'id x__)
                (Control.DeepSeq.deepseq
                   (_Mapping'memoryStart x__)
                   (Control.DeepSeq.deepseq
                      (_Mapping'memoryLimit x__)
                      (Control.DeepSeq.deepseq
                         (_Mapping'fileOffset x__)
                         (Control.DeepSeq.deepseq
                            (_Mapping'filename x__)
                            (Control.DeepSeq.deepseq
                               (_Mapping'buildId x__)
                               (Control.DeepSeq.deepseq
                                  (_Mapping'hasFunctions x__)
                                  (Control.DeepSeq.deepseq
                                     (_Mapping'hasFilenames x__)
                                     (Control.DeepSeq.deepseq
                                        (_Mapping'hasLineNumbers x__)
                                        (Control.DeepSeq.deepseq
                                           (_Mapping'hasInlineFrames x__) ()))))))))))
{- | Fields :
     
         * 'Proto.Pprof.Profile_Fields.sampleType' @:: Lens' Profile [ValueType]@
         * 'Proto.Pprof.Profile_Fields.vec'sampleType' @:: Lens' Profile (Data.Vector.Vector ValueType)@
         * 'Proto.Pprof.Profile_Fields.sample' @:: Lens' Profile [Sample]@
         * 'Proto.Pprof.Profile_Fields.vec'sample' @:: Lens' Profile (Data.Vector.Vector Sample)@
         * 'Proto.Pprof.Profile_Fields.mapping' @:: Lens' Profile [Mapping]@
         * 'Proto.Pprof.Profile_Fields.vec'mapping' @:: Lens' Profile (Data.Vector.Vector Mapping)@
         * 'Proto.Pprof.Profile_Fields.location' @:: Lens' Profile [Location]@
         * 'Proto.Pprof.Profile_Fields.vec'location' @:: Lens' Profile (Data.Vector.Vector Location)@
         * 'Proto.Pprof.Profile_Fields.function' @:: Lens' Profile [Function]@
         * 'Proto.Pprof.Profile_Fields.vec'function' @:: Lens' Profile (Data.Vector.Vector Function)@
         * 'Proto.Pprof.Profile_Fields.stringTable' @:: Lens' Profile [Data.Text.Text]@
         * 'Proto.Pprof.Profile_Fields.vec'stringTable' @:: Lens' Profile (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Pprof.Profile_Fields.dropFrames' @:: Lens' Profile Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.keepFrames' @:: Lens' Profile Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.timeNanos' @:: Lens' Profile Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.durationNanos' @:: Lens' Profile Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.periodType' @:: Lens' Profile ValueType@
         * 'Proto.Pprof.Profile_Fields.maybe'periodType' @:: Lens' Profile (Prelude.Maybe ValueType)@
         * 'Proto.Pprof.Profile_Fields.period' @:: Lens' Profile Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.comment' @:: Lens' Profile [Data.Int.Int64]@
         * 'Proto.Pprof.Profile_Fields.vec'comment' @:: Lens' Profile (Data.Vector.Unboxed.Vector Data.Int.Int64)@
         * 'Proto.Pprof.Profile_Fields.defaultSampleType' @:: Lens' Profile Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.docUrl' @:: Lens' Profile Data.Int.Int64@ -}
data Profile
  = Profile'_constructor {_Profile'sampleType :: !(Data.Vector.Vector ValueType),
                          _Profile'sample :: !(Data.Vector.Vector Sample),
                          _Profile'mapping :: !(Data.Vector.Vector Mapping),
                          _Profile'location :: !(Data.Vector.Vector Location),
                          _Profile'function :: !(Data.Vector.Vector Function),
                          _Profile'stringTable :: !(Data.Vector.Vector Data.Text.Text),
                          _Profile'dropFrames :: !Data.Int.Int64,
                          _Profile'keepFrames :: !Data.Int.Int64,
                          _Profile'timeNanos :: !Data.Int.Int64,
                          _Profile'durationNanos :: !Data.Int.Int64,
                          _Profile'periodType :: !(Prelude.Maybe ValueType),
                          _Profile'period :: !Data.Int.Int64,
                          _Profile'comment :: !(Data.Vector.Unboxed.Vector Data.Int.Int64),
                          _Profile'defaultSampleType :: !Data.Int.Int64,
                          _Profile'docUrl :: !Data.Int.Int64,
                          _Profile'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Profile where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Profile "sampleType" [ValueType] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'sampleType (\ x__ y__ -> x__ {_Profile'sampleType = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Profile "vec'sampleType" (Data.Vector.Vector ValueType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'sampleType (\ x__ y__ -> x__ {_Profile'sampleType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "sample" [Sample] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'sample (\ x__ y__ -> x__ {_Profile'sample = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Profile "vec'sample" (Data.Vector.Vector Sample) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'sample (\ x__ y__ -> x__ {_Profile'sample = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "mapping" [Mapping] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'mapping (\ x__ y__ -> x__ {_Profile'mapping = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Profile "vec'mapping" (Data.Vector.Vector Mapping) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'mapping (\ x__ y__ -> x__ {_Profile'mapping = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "location" [Location] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'location (\ x__ y__ -> x__ {_Profile'location = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Profile "vec'location" (Data.Vector.Vector Location) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'location (\ x__ y__ -> x__ {_Profile'location = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "function" [Function] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'function (\ x__ y__ -> x__ {_Profile'function = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Profile "vec'function" (Data.Vector.Vector Function) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'function (\ x__ y__ -> x__ {_Profile'function = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "stringTable" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'stringTable
           (\ x__ y__ -> x__ {_Profile'stringTable = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Profile "vec'stringTable" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'stringTable
           (\ x__ y__ -> x__ {_Profile'stringTable = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "dropFrames" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'dropFrames (\ x__ y__ -> x__ {_Profile'dropFrames = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "keepFrames" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'keepFrames (\ x__ y__ -> x__ {_Profile'keepFrames = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "timeNanos" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'timeNanos (\ x__ y__ -> x__ {_Profile'timeNanos = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "durationNanos" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'durationNanos
           (\ x__ y__ -> x__ {_Profile'durationNanos = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "periodType" ValueType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'periodType (\ x__ y__ -> x__ {_Profile'periodType = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Profile "maybe'periodType" (Prelude.Maybe ValueType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'periodType (\ x__ y__ -> x__ {_Profile'periodType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "period" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'period (\ x__ y__ -> x__ {_Profile'period = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "comment" [Data.Int.Int64] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'comment (\ x__ y__ -> x__ {_Profile'comment = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Profile "vec'comment" (Data.Vector.Unboxed.Vector Data.Int.Int64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'comment (\ x__ y__ -> x__ {_Profile'comment = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "defaultSampleType" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'defaultSampleType
           (\ x__ y__ -> x__ {_Profile'defaultSampleType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Profile "docUrl" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Profile'docUrl (\ x__ y__ -> x__ {_Profile'docUrl = y__}))
        Prelude.id
instance Data.ProtoLens.Message Profile where
  messageName _ = Data.Text.pack "perftools.profiles.Profile"
  packedMessageDescriptor _
    = "\n\
      \\aProfile\DC2>\n\
      \\vsample_type\CAN\SOH \ETX(\v2\GS.perftools.profiles.ValueTypeR\n\
      \sampleType\DC22\n\
      \\ACKsample\CAN\STX \ETX(\v2\SUB.perftools.profiles.SampleR\ACKsample\DC25\n\
      \\amapping\CAN\ETX \ETX(\v2\ESC.perftools.profiles.MappingR\amapping\DC28\n\
      \\blocation\CAN\EOT \ETX(\v2\FS.perftools.profiles.LocationR\blocation\DC28\n\
      \\bfunction\CAN\ENQ \ETX(\v2\FS.perftools.profiles.FunctionR\bfunction\DC2!\n\
      \\fstring_table\CAN\ACK \ETX(\tR\vstringTable\DC2\US\n\
      \\vdrop_frames\CAN\a \SOH(\ETXR\n\
      \dropFrames\DC2\US\n\
      \\vkeep_frames\CAN\b \SOH(\ETXR\n\
      \keepFrames\DC2\GS\n\
      \\n\
      \time_nanos\CAN\t \SOH(\ETXR\ttimeNanos\DC2%\n\
      \\SOduration_nanos\CAN\n\
      \ \SOH(\ETXR\rdurationNanos\DC2>\n\
      \\vperiod_type\CAN\v \SOH(\v2\GS.perftools.profiles.ValueTypeR\n\
      \periodType\DC2\SYN\n\
      \\ACKperiod\CAN\f \SOH(\ETXR\ACKperiod\DC2\CAN\n\
      \\acomment\CAN\r \ETX(\ETXR\acomment\DC2.\n\
      \\DC3default_sample_type\CAN\SO \SOH(\ETXR\DC1defaultSampleType\DC2\ETB\n\
      \\adoc_url\CAN\SI \SOH(\ETXR\ACKdocUrl"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        sampleType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sample_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ValueType)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"sampleType")) ::
              Data.ProtoLens.FieldDescriptor Profile
        sample__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sample"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Sample)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"sample")) ::
              Data.ProtoLens.FieldDescriptor Profile
        mapping__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "mapping"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Mapping)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"mapping")) ::
              Data.ProtoLens.FieldDescriptor Profile
        location__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "location"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Location)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"location")) ::
              Data.ProtoLens.FieldDescriptor Profile
        function__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "function"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Function)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"function")) ::
              Data.ProtoLens.FieldDescriptor Profile
        stringTable__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "string_table"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"stringTable")) ::
              Data.ProtoLens.FieldDescriptor Profile
        dropFrames__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "drop_frames"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"dropFrames")) ::
              Data.ProtoLens.FieldDescriptor Profile
        keepFrames__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "keep_frames"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"keepFrames")) ::
              Data.ProtoLens.FieldDescriptor Profile
        timeNanos__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "time_nanos"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"timeNanos")) ::
              Data.ProtoLens.FieldDescriptor Profile
        durationNanos__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "duration_nanos"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"durationNanos")) ::
              Data.ProtoLens.FieldDescriptor Profile
        periodType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "period_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ValueType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'periodType")) ::
              Data.ProtoLens.FieldDescriptor Profile
        period__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "period"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"period")) ::
              Data.ProtoLens.FieldDescriptor Profile
        comment__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "comment"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed (Data.ProtoLens.Field.field @"comment")) ::
              Data.ProtoLens.FieldDescriptor Profile
        defaultSampleType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "default_sample_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"defaultSampleType")) ::
              Data.ProtoLens.FieldDescriptor Profile
        docUrl__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "doc_url"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"docUrl")) ::
              Data.ProtoLens.FieldDescriptor Profile
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, sampleType__field_descriptor),
           (Data.ProtoLens.Tag 2, sample__field_descriptor),
           (Data.ProtoLens.Tag 3, mapping__field_descriptor),
           (Data.ProtoLens.Tag 4, location__field_descriptor),
           (Data.ProtoLens.Tag 5, function__field_descriptor),
           (Data.ProtoLens.Tag 6, stringTable__field_descriptor),
           (Data.ProtoLens.Tag 7, dropFrames__field_descriptor),
           (Data.ProtoLens.Tag 8, keepFrames__field_descriptor),
           (Data.ProtoLens.Tag 9, timeNanos__field_descriptor),
           (Data.ProtoLens.Tag 10, durationNanos__field_descriptor),
           (Data.ProtoLens.Tag 11, periodType__field_descriptor),
           (Data.ProtoLens.Tag 12, period__field_descriptor),
           (Data.ProtoLens.Tag 13, comment__field_descriptor),
           (Data.ProtoLens.Tag 14, defaultSampleType__field_descriptor),
           (Data.ProtoLens.Tag 15, docUrl__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Profile'_unknownFields
        (\ x__ y__ -> x__ {_Profile'_unknownFields = y__})
  defMessage
    = Profile'_constructor
        {_Profile'sampleType = Data.Vector.Generic.empty,
         _Profile'sample = Data.Vector.Generic.empty,
         _Profile'mapping = Data.Vector.Generic.empty,
         _Profile'location = Data.Vector.Generic.empty,
         _Profile'function = Data.Vector.Generic.empty,
         _Profile'stringTable = Data.Vector.Generic.empty,
         _Profile'dropFrames = Data.ProtoLens.fieldDefault,
         _Profile'keepFrames = Data.ProtoLens.fieldDefault,
         _Profile'timeNanos = Data.ProtoLens.fieldDefault,
         _Profile'durationNanos = Data.ProtoLens.fieldDefault,
         _Profile'periodType = Prelude.Nothing,
         _Profile'period = Data.ProtoLens.fieldDefault,
         _Profile'comment = Data.Vector.Generic.empty,
         _Profile'defaultSampleType = Data.ProtoLens.fieldDefault,
         _Profile'docUrl = Data.ProtoLens.fieldDefault,
         _Profile'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Profile
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Unboxed.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Int.Int64
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Function
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Location
                   -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Mapping
                      -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Sample
                         -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ValueType
                            -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
                               -> Data.ProtoLens.Encoding.Bytes.Parser Profile
        loop
          x
          mutable'comment
          mutable'function
          mutable'location
          mutable'mapping
          mutable'sample
          mutable'sampleType
          mutable'stringTable
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'comment <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'comment)
                      frozen'function <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'function)
                      frozen'location <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'location)
                      frozen'mapping <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'mapping)
                      frozen'sample <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'sample)
                      frozen'sampleType <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'sampleType)
                      frozen'stringTable <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'stringTable)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'comment") frozen'comment
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'function") frozen'function
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'location") frozen'location
                                    (Lens.Family2.set
                                       (Data.ProtoLens.Field.field @"vec'mapping") frozen'mapping
                                       (Lens.Family2.set
                                          (Data.ProtoLens.Field.field @"vec'sample") frozen'sample
                                          (Lens.Family2.set
                                             (Data.ProtoLens.Field.field @"vec'sampleType")
                                             frozen'sampleType
                                             (Lens.Family2.set
                                                (Data.ProtoLens.Field.field @"vec'stringTable")
                                                frozen'stringTable x))))))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "sample_type"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'sampleType y)
                                loop
                                  x mutable'comment mutable'function mutable'location
                                  mutable'mapping mutable'sample v mutable'stringTable
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "sample"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'sample y)
                                loop
                                  x mutable'comment mutable'function mutable'location
                                  mutable'mapping v mutable'sampleType mutable'stringTable
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "mapping"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'mapping y)
                                loop
                                  x mutable'comment mutable'function mutable'location v
                                  mutable'sample mutable'sampleType mutable'stringTable
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "location"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'location y)
                                loop
                                  x mutable'comment mutable'function v mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        42
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "function"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'function y)
                                loop
                                  x mutable'comment v mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        50
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "string_table"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'stringTable y)
                                loop
                                  x mutable'comment mutable'function mutable'location
                                  mutable'mapping mutable'sample mutable'sampleType v
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "drop_frames"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"dropFrames") y x)
                                  mutable'comment mutable'function mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        64
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "keep_frames"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"keepFrames") y x)
                                  mutable'comment mutable'function mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        72
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "time_nanos"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"timeNanos") y x)
                                  mutable'comment mutable'function mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        80
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "duration_nanos"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"durationNanos") y x)
                                  mutable'comment mutable'function mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        90
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "period_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"periodType") y x)
                                  mutable'comment mutable'function mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        96
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "period"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"period") y x)
                                  mutable'comment mutable'function mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        104
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.fromIntegral
                                           Data.ProtoLens.Encoding.Bytes.getVarInt)
                                        "comment"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'comment y)
                                loop
                                  x v mutable'function mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        106
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.fromIntegral
                                                                       Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                                    "comment"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'comment)
                                loop
                                  x y mutable'function mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        112
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "default_sample_type"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"defaultSampleType") y x)
                                  mutable'comment mutable'function mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        120
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "doc_url"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"docUrl") y x)
                                  mutable'comment mutable'function mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'comment mutable'function mutable'location mutable'mapping
                                  mutable'sample mutable'sampleType mutable'stringTable
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'comment <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              mutable'function <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              mutable'location <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              mutable'mapping <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              mutable'sample <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              mutable'sampleType <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              mutable'stringTable <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'comment mutable'function
                mutable'location mutable'mapping mutable'sample mutable'sampleType
                mutable'stringTable)
          "Profile"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'sampleType") _x))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'sample") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'mapping") _x))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'location") _x))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.ProtoLens.encodeMessage _v))
                            (Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'function") _x))
                         ((Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                               (\ _v
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                                       ((Prelude..)
                                          (\ bs
                                             -> (Data.Monoid.<>)
                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                     (Prelude.fromIntegral
                                                        (Data.ByteString.length bs)))
                                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                          Data.Text.Encoding.encodeUtf8 _v))
                               (Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"vec'stringTable") _x))
                            ((Data.Monoid.<>)
                               (let
                                  _v
                                    = Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"dropFrames") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                        ((Prelude..)
                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                           Prelude.fromIntegral _v))
                               ((Data.Monoid.<>)
                                  (let
                                     _v
                                       = Lens.Family2.view
                                           (Data.ProtoLens.Field.field @"keepFrames") _x
                                   in
                                     if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                         Data.Monoid.mempty
                                     else
                                         (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt 64)
                                           ((Prelude..)
                                              Data.ProtoLens.Encoding.Bytes.putVarInt
                                              Prelude.fromIntegral _v))
                                  ((Data.Monoid.<>)
                                     (let
                                        _v
                                          = Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"timeNanos") _x
                                      in
                                        if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                            Data.Monoid.mempty
                                        else
                                            (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt 72)
                                              ((Prelude..)
                                                 Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 Prelude.fromIntegral _v))
                                     ((Data.Monoid.<>)
                                        (let
                                           _v
                                             = Lens.Family2.view
                                                 (Data.ProtoLens.Field.field @"durationNanos") _x
                                         in
                                           if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                               Data.Monoid.mempty
                                           else
                                               (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 80)
                                                 ((Prelude..)
                                                    Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    Prelude.fromIntegral _v))
                                        ((Data.Monoid.<>)
                                           (case
                                                Lens.Family2.view
                                                  (Data.ProtoLens.Field.field @"maybe'periodType")
                                                  _x
                                            of
                                              Prelude.Nothing -> Data.Monoid.mempty
                                              (Prelude.Just _v)
                                                -> (Data.Monoid.<>)
                                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 90)
                                                     ((Prelude..)
                                                        (\ bs
                                                           -> (Data.Monoid.<>)
                                                                (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                   (Prelude.fromIntegral
                                                                      (Data.ByteString.length bs)))
                                                                (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                   bs))
                                                        Data.ProtoLens.encodeMessage _v))
                                           ((Data.Monoid.<>)
                                              (let
                                                 _v
                                                   = Lens.Family2.view
                                                       (Data.ProtoLens.Field.field @"period") _x
                                               in
                                                 if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                                     Data.Monoid.mempty
                                                 else
                                                     (Data.Monoid.<>)
                                                       (Data.ProtoLens.Encoding.Bytes.putVarInt 96)
                                                       ((Prelude..)
                                                          Data.ProtoLens.Encoding.Bytes.putVarInt
                                                          Prelude.fromIntegral _v))
                                              ((Data.Monoid.<>)
                                                 (let
                                                    p = Lens.Family2.view
                                                          (Data.ProtoLens.Field.field
                                                             @"vec'comment")
                                                          _x
                                                  in
                                                    if Data.Vector.Generic.null p then
                                                        Data.Monoid.mempty
                                                    else
                                                        (Data.Monoid.<>)
                                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                             106)
                                                          ((\ bs
                                                              -> (Data.Monoid.<>)
                                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                      (Prelude.fromIntegral
                                                                         (Data.ByteString.length
                                                                            bs)))
                                                                   (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                      bs))
                                                             (Data.ProtoLens.Encoding.Bytes.runBuilder
                                                                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                                                   ((Prelude..)
                                                                      Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                      Prelude.fromIntegral)
                                                                   p))))
                                                 ((Data.Monoid.<>)
                                                    (let
                                                       _v
                                                         = Lens.Family2.view
                                                             (Data.ProtoLens.Field.field
                                                                @"defaultSampleType")
                                                             _x
                                                     in
                                                       if (Prelude.==)
                                                            _v Data.ProtoLens.fieldDefault then
                                                           Data.Monoid.mempty
                                                       else
                                                           (Data.Monoid.<>)
                                                             (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                112)
                                                             ((Prelude..)
                                                                Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                Prelude.fromIntegral _v))
                                                    ((Data.Monoid.<>)
                                                       (let
                                                          _v
                                                            = Lens.Family2.view
                                                                (Data.ProtoLens.Field.field
                                                                   @"docUrl")
                                                                _x
                                                        in
                                                          if (Prelude.==)
                                                               _v Data.ProtoLens.fieldDefault then
                                                              Data.Monoid.mempty
                                                          else
                                                              (Data.Monoid.<>)
                                                                (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                   120)
                                                                ((Prelude..)
                                                                   Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                   Prelude.fromIntegral _v))
                                                       (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                                          (Lens.Family2.view
                                                             Data.ProtoLens.unknownFields
                                                             _x))))))))))))))))
instance Control.DeepSeq.NFData Profile where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Profile'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Profile'sampleType x__)
                (Control.DeepSeq.deepseq
                   (_Profile'sample x__)
                   (Control.DeepSeq.deepseq
                      (_Profile'mapping x__)
                      (Control.DeepSeq.deepseq
                         (_Profile'location x__)
                         (Control.DeepSeq.deepseq
                            (_Profile'function x__)
                            (Control.DeepSeq.deepseq
                               (_Profile'stringTable x__)
                               (Control.DeepSeq.deepseq
                                  (_Profile'dropFrames x__)
                                  (Control.DeepSeq.deepseq
                                     (_Profile'keepFrames x__)
                                     (Control.DeepSeq.deepseq
                                        (_Profile'timeNanos x__)
                                        (Control.DeepSeq.deepseq
                                           (_Profile'durationNanos x__)
                                           (Control.DeepSeq.deepseq
                                              (_Profile'periodType x__)
                                              (Control.DeepSeq.deepseq
                                                 (_Profile'period x__)
                                                 (Control.DeepSeq.deepseq
                                                    (_Profile'comment x__)
                                                    (Control.DeepSeq.deepseq
                                                       (_Profile'defaultSampleType x__)
                                                       (Control.DeepSeq.deepseq
                                                          (_Profile'docUrl x__) ())))))))))))))))
{- | Fields :
     
         * 'Proto.Pprof.Profile_Fields.locationId' @:: Lens' Sample [Data.Word.Word64]@
         * 'Proto.Pprof.Profile_Fields.vec'locationId' @:: Lens' Sample (Data.Vector.Unboxed.Vector Data.Word.Word64)@
         * 'Proto.Pprof.Profile_Fields.value' @:: Lens' Sample [Data.Int.Int64]@
         * 'Proto.Pprof.Profile_Fields.vec'value' @:: Lens' Sample (Data.Vector.Unboxed.Vector Data.Int.Int64)@
         * 'Proto.Pprof.Profile_Fields.label' @:: Lens' Sample [Label]@
         * 'Proto.Pprof.Profile_Fields.vec'label' @:: Lens' Sample (Data.Vector.Vector Label)@ -}
data Sample
  = Sample'_constructor {_Sample'locationId :: !(Data.Vector.Unboxed.Vector Data.Word.Word64),
                         _Sample'value :: !(Data.Vector.Unboxed.Vector Data.Int.Int64),
                         _Sample'label :: !(Data.Vector.Vector Label),
                         _Sample'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Sample where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Sample "locationId" [Data.Word.Word64] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Sample'locationId (\ x__ y__ -> x__ {_Sample'locationId = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Sample "vec'locationId" (Data.Vector.Unboxed.Vector Data.Word.Word64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Sample'locationId (\ x__ y__ -> x__ {_Sample'locationId = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Sample "value" [Data.Int.Int64] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Sample'value (\ x__ y__ -> x__ {_Sample'value = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Sample "vec'value" (Data.Vector.Unboxed.Vector Data.Int.Int64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Sample'value (\ x__ y__ -> x__ {_Sample'value = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Sample "label" [Label] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Sample'label (\ x__ y__ -> x__ {_Sample'label = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Sample "vec'label" (Data.Vector.Vector Label) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Sample'label (\ x__ y__ -> x__ {_Sample'label = y__}))
        Prelude.id
instance Data.ProtoLens.Message Sample where
  messageName _ = Data.Text.pack "perftools.profiles.Sample"
  packedMessageDescriptor _
    = "\n\
      \\ACKSample\DC2\US\n\
      \\vlocation_id\CAN\SOH \ETX(\EOTR\n\
      \locationId\DC2\DC4\n\
      \\ENQvalue\CAN\STX \ETX(\ETXR\ENQvalue\DC2/\n\
      \\ENQlabel\CAN\ETX \ETX(\v2\EM.perftools.profiles.LabelR\ENQlabel"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        locationId__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "location_id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed
                 (Data.ProtoLens.Field.field @"locationId")) ::
              Data.ProtoLens.FieldDescriptor Sample
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor Sample
        label__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "label"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Label)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"label")) ::
              Data.ProtoLens.FieldDescriptor Sample
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, locationId__field_descriptor),
           (Data.ProtoLens.Tag 2, value__field_descriptor),
           (Data.ProtoLens.Tag 3, label__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Sample'_unknownFields
        (\ x__ y__ -> x__ {_Sample'_unknownFields = y__})
  defMessage
    = Sample'_constructor
        {_Sample'locationId = Data.Vector.Generic.empty,
         _Sample'value = Data.Vector.Generic.empty,
         _Sample'label = Data.Vector.Generic.empty,
         _Sample'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Sample
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Label
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Unboxed.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Word.Word64
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Unboxed.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Int.Int64
                   -> Data.ProtoLens.Encoding.Bytes.Parser Sample
        loop x mutable'label mutable'locationId mutable'value
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'label <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'label)
                      frozen'locationId <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'locationId)
                      frozen'value <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'value)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'label") frozen'label
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'locationId") frozen'locationId
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'value") frozen'value x))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        Data.ProtoLens.Encoding.Bytes.getVarInt "location_id"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'locationId y)
                                loop x mutable'label v mutable'value
                        10
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    Data.ProtoLens.Encoding.Bytes.getVarInt
                                                                    "location_id"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'locationId)
                                loop x mutable'label y mutable'value
                        16
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.fromIntegral
                                           Data.ProtoLens.Encoding.Bytes.getVarInt)
                                        "value"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'value y)
                                loop x mutable'label mutable'locationId v
                        18
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.fromIntegral
                                                                       Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                                    "value"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'value)
                                loop x mutable'label mutable'locationId y
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "label"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'label y)
                                loop x v mutable'locationId mutable'value
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'label mutable'locationId mutable'value
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'label <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              mutable'locationId <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              mutable'value <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'label mutable'locationId
                mutable'value)
          "Sample"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                p = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'locationId") _x
              in
                if Data.Vector.Generic.null p then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         (Data.ProtoLens.Encoding.Bytes.runBuilder
                            (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                               Data.ProtoLens.Encoding.Bytes.putVarInt p))))
             ((Data.Monoid.<>)
                (let
                   p = Lens.Family2.view (Data.ProtoLens.Field.field @"vec'value") _x
                 in
                   if Data.Vector.Generic.null p then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            (Data.ProtoLens.Encoding.Bytes.runBuilder
                               (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                  p))))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'label") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Sample where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Sample'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Sample'locationId x__)
                (Control.DeepSeq.deepseq
                   (_Sample'value x__)
                   (Control.DeepSeq.deepseq (_Sample'label x__) ())))
{- | Fields :
     
         * 'Proto.Pprof.Profile_Fields.type'' @:: Lens' ValueType Data.Int.Int64@
         * 'Proto.Pprof.Profile_Fields.unit' @:: Lens' ValueType Data.Int.Int64@ -}
data ValueType
  = ValueType'_constructor {_ValueType'type' :: !Data.Int.Int64,
                            _ValueType'unit :: !Data.Int.Int64,
                            _ValueType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ValueType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ValueType "type'" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ValueType'type' (\ x__ y__ -> x__ {_ValueType'type' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ValueType "unit" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ValueType'unit (\ x__ y__ -> x__ {_ValueType'unit = y__}))
        Prelude.id
instance Data.ProtoLens.Message ValueType where
  messageName _ = Data.Text.pack "perftools.profiles.ValueType"
  packedMessageDescriptor _
    = "\n\
      \\tValueType\DC2\DC2\n\
      \\EOTtype\CAN\SOH \SOH(\ETXR\EOTtype\DC2\DC2\n\
      \\EOTunit\CAN\STX \SOH(\ETXR\EOTunit"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        type'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"type'")) ::
              Data.ProtoLens.FieldDescriptor ValueType
        unit__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "unit"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"unit")) ::
              Data.ProtoLens.FieldDescriptor ValueType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, type'__field_descriptor),
           (Data.ProtoLens.Tag 2, unit__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ValueType'_unknownFields
        (\ x__ y__ -> x__ {_ValueType'_unknownFields = y__})
  defMessage
    = ValueType'_constructor
        {_ValueType'type' = Data.ProtoLens.fieldDefault,
         _ValueType'unit = Data.ProtoLens.fieldDefault,
         _ValueType'_unknownFields = []}
  parseMessage
    = let
        loop :: ValueType -> Data.ProtoLens.Encoding.Bytes.Parser ValueType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "type"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"type'") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "unit"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"unit") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ValueType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"type'") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"unit") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData ValueType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ValueType'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ValueType'type' x__)
                (Control.DeepSeq.deepseq (_ValueType'unit x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\DC3pprof/profile.proto\DC2\DC2perftools.profiles\"\142\ENQ\n\
    \\aProfile\DC2>\n\
    \\vsample_type\CAN\SOH \ETX(\v2\GS.perftools.profiles.ValueTypeR\n\
    \sampleType\DC22\n\
    \\ACKsample\CAN\STX \ETX(\v2\SUB.perftools.profiles.SampleR\ACKsample\DC25\n\
    \\amapping\CAN\ETX \ETX(\v2\ESC.perftools.profiles.MappingR\amapping\DC28\n\
    \\blocation\CAN\EOT \ETX(\v2\FS.perftools.profiles.LocationR\blocation\DC28\n\
    \\bfunction\CAN\ENQ \ETX(\v2\FS.perftools.profiles.FunctionR\bfunction\DC2!\n\
    \\fstring_table\CAN\ACK \ETX(\tR\vstringTable\DC2\US\n\
    \\vdrop_frames\CAN\a \SOH(\ETXR\n\
    \dropFrames\DC2\US\n\
    \\vkeep_frames\CAN\b \SOH(\ETXR\n\
    \keepFrames\DC2\GS\n\
    \\n\
    \time_nanos\CAN\t \SOH(\ETXR\ttimeNanos\DC2%\n\
    \\SOduration_nanos\CAN\n\
    \ \SOH(\ETXR\rdurationNanos\DC2>\n\
    \\vperiod_type\CAN\v \SOH(\v2\GS.perftools.profiles.ValueTypeR\n\
    \periodType\DC2\SYN\n\
    \\ACKperiod\CAN\f \SOH(\ETXR\ACKperiod\DC2\CAN\n\
    \\acomment\CAN\r \ETX(\ETXR\acomment\DC2.\n\
    \\DC3default_sample_type\CAN\SO \SOH(\ETXR\DC1defaultSampleType\DC2\ETB\n\
    \\adoc_url\CAN\SI \SOH(\ETXR\ACKdocUrl\"3\n\
    \\tValueType\DC2\DC2\n\
    \\EOTtype\CAN\SOH \SOH(\ETXR\EOTtype\DC2\DC2\n\
    \\EOTunit\CAN\STX \SOH(\ETXR\EOTunit\"p\n\
    \\ACKSample\DC2\US\n\
    \\vlocation_id\CAN\SOH \ETX(\EOTR\n\
    \locationId\DC2\DC4\n\
    \\ENQvalue\CAN\STX \ETX(\ETXR\ENQvalue\DC2/\n\
    \\ENQlabel\CAN\ETX \ETX(\v2\EM.perftools.profiles.LabelR\ENQlabel\"X\n\
    \\ENQLabel\DC2\DLE\n\
    \\ETXkey\CAN\SOH \SOH(\ETXR\ETXkey\DC2\DLE\n\
    \\ETXstr\CAN\STX \SOH(\ETXR\ETXstr\DC2\DLE\n\
    \\ETXnum\CAN\ETX \SOH(\ETXR\ETXnum\DC2\EM\n\
    \\bnum_unit\CAN\EOT \SOH(\ETXR\anumUnit\"\215\STX\n\
    \\aMapping\DC2\SO\n\
    \\STXid\CAN\SOH \SOH(\EOTR\STXid\DC2!\n\
    \\fmemory_start\CAN\STX \SOH(\EOTR\vmemoryStart\DC2!\n\
    \\fmemory_limit\CAN\ETX \SOH(\EOTR\vmemoryLimit\DC2\US\n\
    \\vfile_offset\CAN\EOT \SOH(\EOTR\n\
    \fileOffset\DC2\SUB\n\
    \\bfilename\CAN\ENQ \SOH(\ETXR\bfilename\DC2\EM\n\
    \\bbuild_id\CAN\ACK \SOH(\ETXR\abuildId\DC2#\n\
    \\rhas_functions\CAN\a \SOH(\bR\fhasFunctions\DC2#\n\
    \\rhas_filenames\CAN\b \SOH(\bR\fhasFilenames\DC2(\n\
    \\DLEhas_line_numbers\CAN\t \SOH(\bR\SOhasLineNumbers\DC2*\n\
    \\DC1has_inline_frames\CAN\n\
    \ \SOH(\bR\SIhasInlineFrames\"\158\SOH\n\
    \\bLocation\DC2\SO\n\
    \\STXid\CAN\SOH \SOH(\EOTR\STXid\DC2\GS\n\
    \\n\
    \mapping_id\CAN\STX \SOH(\EOTR\tmappingId\DC2\CAN\n\
    \\aaddress\CAN\ETX \SOH(\EOTR\aaddress\DC2,\n\
    \\EOTline\CAN\EOT \ETX(\v2\CAN.perftools.profiles.LineR\EOTline\DC2\ESC\n\
    \\tis_folded\CAN\ENQ \SOH(\bR\bisFolded\"S\n\
    \\EOTLine\DC2\US\n\
    \\vfunction_id\CAN\SOH \SOH(\EOTR\n\
    \functionId\DC2\DC2\n\
    \\EOTline\CAN\STX \SOH(\ETXR\EOTline\DC2\SYN\n\
    \\ACKcolumn\CAN\ETX \SOH(\ETXR\ACKcolumn\"\138\SOH\n\
    \\bFunction\DC2\SO\n\
    \\STXid\CAN\SOH \SOH(\EOTR\STXid\DC2\DC2\n\
    \\EOTname\CAN\STX \SOH(\ETXR\EOTname\DC2\US\n\
    \\vsystem_name\CAN\ETX \SOH(\ETXR\n\
    \systemName\DC2\SUB\n\
    \\bfilename\CAN\EOT \SOH(\ETXR\bfilename\DC2\GS\n\
    \\n\
    \start_line\CAN\ENQ \SOH(\ETXR\tstartLineB-\n\
    \\GScom.google.perftools.profilesB\fProfileProtoJ\250W\n\
    \\a\DC2\ENQ&\NUL\232\SOH\SOH\n\
    \\158\f\n\
    \\SOH\f\DC2\ETX&\NUL\DC22\199\EOT Copyright 2016 Google Inc. All Rights Reserved.\n\
    \\n\
    \ Licensed under the Apache License, Version 2.0 (the \"License\");\n\
    \ you may not use this file except in compliance with the License.\n\
    \ You may obtain a copy of the License at\n\
    \\n\
    \     http://www.apache.org/licenses/LICENSE-2.0\n\
    \\n\
    \ Unless required by applicable law or agreed to in writing, software\n\
    \ distributed under the License is distributed on an \"AS IS\" BASIS,\n\
    \ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n\
    \ See the License for the specific language governing permissions and\n\
    \ limitations under the License.\n\
    \2\201\a Profile is a common stacktrace profile format.\n\
    \\n\
    \ Measurements represented with this format should follow the\n\
    \ following conventions:\n\
    \\n\
    \ - Consumers should treat unset optional fields as if they had been\n\
    \   set with their default value.\n\
    \\n\
    \ - When possible, measurements should be stored in \"unsampled\" form\n\
    \   that is most useful to humans.  There should be enough\n\
    \   information present to determine the original sampled values.\n\
    \\n\
    \ - On-disk, the serialized proto must be gzip-compressed.\n\
    \\n\
    \ - The profile is represented as a set of samples, where each sample\n\
    \   references a sequence of locations, and where each location belongs\n\
    \   to a mapping.\n\
    \ - There is a N->1 relationship from sample.location_id entries to\n\
    \   locations. For every sample.location_id entry there must be a\n\
    \   unique Location with that id.\n\
    \ - There is an optional N->1 relationship from locations to\n\
    \   mappings. For every nonzero Location.mapping_id there must be a\n\
    \   unique Mapping with that id.\n\
    \\n\
    \\b\n\
    \\SOH\STX\DC2\ETX(\NUL\ESC\n\
    \\b\n\
    \\SOH\b\DC2\ETX*\NUL6\n\
    \\t\n\
    \\STX\b\SOH\DC2\ETX*\NUL6\n\
    \\b\n\
    \\SOH\b\DC2\ETX+\NUL-\n\
    \\t\n\
    \\STX\b\b\DC2\ETX+\NUL-\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT-\NULe\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX-\b\SI\n\
    \\176\ETX\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX6\STX%\SUB\162\ETX A description of the samples associated with each Sample.value.\n\
    \ For a cpu profile this might be:\n\
    \   [[\"cpu\",\"nanoseconds\"]] or [[\"wall\",\"seconds\"]] or [[\"syscall\",\"count\"]]\n\
    \ For a heap profile, this might be:\n\
    \   [[\"allocations\",\"count\"], [\"space\",\"bytes\"]],\n\
    \ If one of the values represents the number of events represented\n\
    \ by the sample, by convention it should be at index 0 and use\n\
    \ sample_type.unit == \"count\".\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\EOT\DC2\ETX6\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ACK\DC2\ETX6\v\DC4\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX6\NAK \n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX6#$\n\
    \;\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX8\STX\GS\SUB. The set of samples recorded in this profile.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\EOT\DC2\ETX8\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX8\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX8\DC2\CAN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX8\ESC\FS\n\
    \\140\SOH\n\
    \\EOT\EOT\NUL\STX\STX\DC2\ETX;\STX\US\SUB\DEL Mapping from address ranges to the image/binary/library mapped\n\
    \ into that address range.  mapping[0] will be the main binary.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\EOT\DC2\ETX;\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ACK\DC2\ETX;\v\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETX;\DC3\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETX;\GS\RS\n\
    \/\n\
    \\EOT\EOT\NUL\STX\ETX\DC2\ETX=\STX!\SUB\" Locations referenced by samples.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\EOT\DC2\ETX=\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ACK\DC2\ETX=\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\SOH\DC2\ETX=\DC4\FS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ETX\DC2\ETX=\US \n\
    \1\n\
    \\EOT\EOT\NUL\STX\EOT\DC2\ETX?\STX!\SUB$ Functions referenced by locations.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\EOT\DC2\ETX?\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\ACK\DC2\ETX?\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\SOH\DC2\ETX?\DC4\FS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\ETX\DC2\ETX?\US \n\
    \m\n\
    \\EOT\EOT\NUL\STX\ENQ\DC2\ETXB\STX#\SUB` A common table for strings referenced by various messages.\n\
    \ string_table[0] must always be \"\".\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\EOT\DC2\ETXB\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\ENQ\DC2\ETXB\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\SOH\DC2\ETXB\DC2\RS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\ETX\DC2\ETXB!\"\n\
    \\178\SOH\n\
    \\EOT\EOT\NUL\STX\ACK\DC2\ETXE\STX\CAN\SUB\136\SOH frames with Function.function_name fully matching the following\n\
    \ regexp will be dropped from the samples, along with their successors.\n\
    \\"\SUB Index into string table.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\ENQ\DC2\ETXE\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\SOH\DC2\ETXE\b\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\ETX\DC2\ETXE\SYN\ETB\n\
    \\160\SOH\n\
    \\EOT\EOT\NUL\STX\a\DC2\ETXH\STX\CAN\SUBw frames with Function.function_name fully matching the following\n\
    \ regexp will be kept, even if it matches drop_frames.\n\
    \\"\SUB Index into string table.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\a\ENQ\DC2\ETXH\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\a\SOH\DC2\ETXH\b\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\a\ETX\DC2\ETXH\SYN\ETB\n\
    \\167\SOH\n\
    \\EOT\EOT\NUL\STX\b\DC2\ETXN\STX\ETB\SUBE Time of collection (UTC) represented as nanoseconds past the epoch.\n\
    \2S The following fields are informational, do not affect\n\
    \ interpretation of results.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\b\ENQ\DC2\ETXN\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\b\SOH\DC2\ETXN\b\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\b\ETX\DC2\ETXN\NAK\SYN\n\
    \B\n\
    \\EOT\EOT\NUL\STX\t\DC2\ETXP\STX\FS\SUB5 Duration of the profile, if a duration makes sense.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\t\ENQ\DC2\ETXP\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\t\SOH\DC2\ETXP\b\SYN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\t\ETX\DC2\ETXP\EM\ESC\n\
    \l\n\
    \\EOT\EOT\NUL\STX\n\
    \\DC2\ETXS\STX\GS\SUB_ The kind of events between sampled occurrences.\n\
    \ e.g [ \"cpu\",\"cycles\" ] or [ \"heap\",\"bytes\" ]\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\n\
    \\ACK\DC2\ETXS\STX\v\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\n\
    \\SOH\DC2\ETXS\f\ETB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\n\
    \\ETX\DC2\ETXS\SUB\FS\n\
    \@\n\
    \\EOT\EOT\NUL\STX\v\DC2\ETXU\STX\DC4\SUB3 The number of events between sampled occurrences.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\v\ENQ\DC2\ETXU\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\v\SOH\DC2\ETXU\b\SO\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\v\ETX\DC2\ETXU\DC1\DC3\n\
    \\225\STX\n\
    \\EOT\EOT\NUL\STX\f\DC2\ETX[\STX\RS\SUB\181\STX Free-form text associated with the profile. The text is displayed as is\n\
    \ to the user by the tools that read profiles (e.g. by pprof). This field\n\
    \ should not be used to store any machine-readable information, it is only\n\
    \ for human-friendly content. The profile must stay functional if this field\n\
    \ is cleaned.\n\
    \\"\FS Indices into string table.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\f\EOT\DC2\ETX[\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\f\ENQ\DC2\ETX[\v\DLE\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\f\SOH\DC2\ETX[\DC1\CAN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\f\ETX\DC2\ETX[\ESC\GS\n\
    \\146\SOH\n\
    \\EOT\EOT\NUL\STX\r\DC2\ETX^\STX!\SUB\132\SOH Index into the string table of the type of the preferred sample\n\
    \ value. If unset, clients should default to the last sample value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\r\ENQ\DC2\ETX^\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\r\SOH\DC2\ETX^\b\ESC\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\r\ETX\DC2\ETX^\RS \n\
    \\251\SOH\n\
    \\EOT\EOT\NUL\STX\SO\DC2\ETXd\STX\NAK\SUB\209\SOH Documentation link for this profile type. The URL must be absolute,\n\
    \ e.g., http://pprof.example.com/cpu-profile.html\n\
    \\n\
    \ The URL may be missing if the profile was generated by code that did not\n\
    \ supply a link.\n\
    \\"\SUB Index into string table.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SO\ENQ\DC2\ETXd\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SO\SOH\DC2\ETXd\b\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SO\ETX\DC2\ETXd\DC2\DC4\n\
    \Q\n\
    \\STX\EOT\SOH\DC2\EOTh\NULk\SOH\SUBE ValueType describes the semantics and measurement units of a value.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETXh\b\DC1\n\
    \'\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETXi\STX\DC1\"\SUB Index into string table.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETXi\STX\a\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETXi\b\f\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETXi\SI\DLE\n\
    \'\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETXj\STX\DC1\"\SUB Index into string table.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETXj\STX\a\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETXj\b\f\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETXj\SI\DLE\n\
    \\255\SOH\n\
    \\STX\EOT\STX\DC2\ENQq\NUL\133\SOH\SOH\SUB\241\SOH Each Sample records values encountered in some program\n\
    \ context. The program context is typically a stack trace, perhaps\n\
    \ augmented with auxiliary information like the thread-id, some\n\
    \ indicator of a higher level request being handled etc.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETXq\b\SO\n\
    \i\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETXt\STX\"\SUB\\ The ids recorded here correspond to a Profile.location.id.\n\
    \ The leaf is at location_id[0].\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\EOT\DC2\ETXt\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETXt\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETXt\DC2\GS\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETXt !\n\
    \\230\STX\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETX{\STX\ESC\SUB\216\STX The type and unit of each value is defined by the corresponding\n\
    \ entry in Profile.sample_type. All samples must have the same\n\
    \ number of values, the same as the length of Profile.sample_type.\n\
    \ When aggregating multiple samples into a single sample, the\n\
    \ result has a list of values that is the element-wise sum of the\n\
    \ lists of the originals.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\EOT\DC2\ETX{\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ENQ\DC2\ETX{\v\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETX{\DC1\SYN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETX{\EM\SUB\n\
    \\242\ETX\n\
    \\EOT\EOT\STX\STX\STX\DC2\EOT\132\SOH\STX\ESC\SUB\227\ETX label includes additional context for this sample. It can include\n\
    \ things like a thread id, allocation size, etc.\n\
    \\n\
    \ NOTE: While possible, having multiple values for the same label key is\n\
    \ strongly discouraged and should never be used. Most tools (e.g. pprof) do\n\
    \ not have good (or any) support for multi-value labels. And an even more\n\
    \ discouraged case is having a string label and a numeric label of the same\n\
    \ name on a sample.  Again, possible to express, but should not be used.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\EOT\DC2\EOT\132\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\ACK\DC2\EOT\132\SOH\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\EOT\132\SOH\DC1\SYN\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\EOT\132\SOH\EM\SUB\n\
    \\f\n\
    \\STX\EOT\ETX\DC2\ACK\135\SOH\NUL\153\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ETX\SOH\DC2\EOT\135\SOH\b\r\n\
    \\188\SOH\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\EOT\139\SOH\STX\DLE\SUB\173\SOH Index into string table. An annotation for a sample (e.g.\n\
    \ \"allocation_size\") with an associated value.\n\
    \ Keys with \"pprof::\" prefix are reserved for internal use by pprof.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\ENQ\DC2\EOT\139\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\EOT\139\SOH\b\v\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\EOT\139\SOH\SO\SI\n\
    \W\n\
    \\EOT\EOT\ETX\STX\SOH\DC2\EOT\142\SOH\STX\DLE\SUB. At most one of the following must be present\n\
    \\"\EM Index into string table\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\ENQ\DC2\EOT\142\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\SOH\DC2\EOT\142\SOH\b\v\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\ETX\DC2\EOT\142\SOH\SO\SI\n\
    \\f\n\
    \\EOT\EOT\ETX\STX\STX\DC2\EOT\143\SOH\STX\DLE\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\ENQ\DC2\EOT\143\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\SOH\DC2\EOT\143\SOH\b\v\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\ETX\DC2\EOT\143\SOH\SO\SI\n\
    \\198\ETX\n\
    \\EOT\EOT\ETX\STX\ETX\DC2\EOT\152\SOH\STX\NAK\SUB\156\ETX Should only be present when num is present.\n\
    \ Specifies the units of num.\n\
    \ Use arbitrary string (for example, \"requests\") as a custom count unit.\n\
    \ If no unit is specified, consumer may apply heuristic to deduce the unit.\n\
    \ Consumers may also  interpret units like \"bytes\" and \"kilobytes\" as memory\n\
    \ units and units like \"seconds\" and \"nanoseconds\" as time units,\n\
    \ and apply appropriate unit conversions to these.\n\
    \\"\EM Index into string table\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\ENQ\DC2\EOT\152\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\SOH\DC2\EOT\152\SOH\b\DLE\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\ETX\DC2\EOT\152\SOH\DC3\DC4\n\
    \\f\n\
    \\STX\EOT\EOT\DC2\ACK\155\SOH\NUL\178\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\EOT\SOH\DC2\EOT\155\SOH\b\SI\n\
    \2\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\EOT\157\SOH\STX\DLE\SUB$ Unique nonzero id for the mapping.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\EOT\157\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\EOT\157\SOH\t\v\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\EOT\157\SOH\SO\SI\n\
    \K\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\EOT\159\SOH\STX\SUB\SUB= Address at which the binary (or DLL) is loaded into memory.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ENQ\DC2\EOT\159\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\EOT\159\SOH\t\NAK\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\EOT\159\SOH\CAN\EM\n\
    \H\n\
    \\EOT\EOT\EOT\STX\STX\DC2\EOT\161\SOH\STX\SUB\SUB: The limit of the address range occupied by this mapping.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\ENQ\DC2\EOT\161\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\SOH\DC2\EOT\161\SOH\t\NAK\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\ETX\DC2\EOT\161\SOH\CAN\EM\n\
    \R\n\
    \\EOT\EOT\EOT\STX\ETX\DC2\EOT\163\SOH\STX\EM\SUBD Offset in the binary that corresponds to the first mapped address.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ETX\ENQ\DC2\EOT\163\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ETX\SOH\DC2\EOT\163\SOH\t\DC4\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ETX\ETX\DC2\EOT\163\SOH\ETB\CAN\n\
    \\196\SOH\n\
    \\EOT\EOT\EOT\STX\EOT\DC2\EOT\167\SOH\STX\NAK\SUB\154\SOH The object this entry is loaded from.  This can be a filename on\n\
    \ disk for the main binary and shared libraries, or virtual\n\
    \ abstractions like \"[vdso]\".\n\
    \\"\EM Index into string table\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\EOT\ENQ\DC2\EOT\167\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\EOT\SOH\DC2\EOT\167\SOH\b\DLE\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\EOT\ETX\DC2\EOT\167\SOH\DC3\DC4\n\
    \\232\SOH\n\
    \\EOT\EOT\EOT\STX\ENQ\DC2\EOT\171\SOH\STX\NAK\SUB\190\SOH A string that uniquely identifies a particular program version\n\
    \ with high probability. E.g., for binaries generated by GNU tools,\n\
    \ it could be the contents of the .note.gnu.build-id field.\n\
    \\"\EM Index into string table\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ENQ\ENQ\DC2\EOT\171\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ENQ\SOH\DC2\EOT\171\SOH\b\DLE\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ENQ\ETX\DC2\EOT\171\SOH\DC3\DC4\n\
    \N\n\
    \\EOT\EOT\EOT\STX\ACK\DC2\EOT\174\SOH\STX\EM\SUB@ The following fields indicate the resolution of symbolic info.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ACK\ENQ\DC2\EOT\174\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ACK\SOH\DC2\EOT\174\SOH\a\DC4\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ACK\ETX\DC2\EOT\174\SOH\ETB\CAN\n\
    \\f\n\
    \\EOT\EOT\EOT\STX\a\DC2\EOT\175\SOH\STX\EM\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\a\ENQ\DC2\EOT\175\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\a\SOH\DC2\EOT\175\SOH\a\DC4\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\a\ETX\DC2\EOT\175\SOH\ETB\CAN\n\
    \\f\n\
    \\EOT\EOT\EOT\STX\b\DC2\EOT\176\SOH\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\b\ENQ\DC2\EOT\176\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\b\SOH\DC2\EOT\176\SOH\a\ETB\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\b\ETX\DC2\EOT\176\SOH\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT\EOT\STX\t\DC2\EOT\177\SOH\STX\RS\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\t\ENQ\DC2\EOT\177\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\t\SOH\DC2\EOT\177\SOH\a\CAN\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\t\ETX\DC2\EOT\177\SOH\ESC\GS\n\
    \D\n\
    \\STX\EOT\ENQ\DC2\ACK\181\SOH\NUL\209\SOH\SOH\SUB6 Describes function and line table debug information.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\ENQ\SOH\DC2\EOT\181\SOH\b\DLE\n\
    \\DEL\n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\EOT\184\SOH\STX\DLE\SUBq Unique nonzero id for the location.  A profile could use\n\
    \ instruction addresses or any integer sequence as ids.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\ENQ\DC2\EOT\184\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\EOT\184\SOH\t\v\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\EOT\184\SOH\SO\SI\n\
    \\164\SOH\n\
    \\EOT\EOT\ENQ\STX\SOH\DC2\EOT\188\SOH\STX\CAN\SUB\149\SOH The id of the corresponding profile.Mapping for this location.\n\
    \ It can be unset if the mapping is unknown or not applicable for\n\
    \ this profile type.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\ENQ\DC2\EOT\188\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\SOH\DC2\EOT\188\SOH\t\DC3\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\ETX\DC2\EOT\188\SOH\SYN\ETB\n\
    \\191\STX\n\
    \\EOT\EOT\ENQ\STX\STX\DC2\EOT\194\SOH\STX\NAK\SUB\176\STX The instruction address for this location, if available.  It\n\
    \ should be within [Mapping.memory_start...Mapping.memory_limit]\n\
    \ for the corresponding mapping. A non-leaf address may be in the\n\
    \ middle of a call instruction. It is up to display tools to find\n\
    \ the beginning of the instruction if necessary.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\STX\ENQ\DC2\EOT\194\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\STX\SOH\DC2\EOT\194\SOH\t\DLE\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\STX\ETX\DC2\EOT\194\SOH\DC3\DC4\n\
    \\161\STX\n\
    \\EOT\EOT\ENQ\STX\ETX\DC2\EOT\202\SOH\STX\EM\SUB\146\STX Multiple line indicates this location has inlined functions,\n\
    \ where the last entry represents the caller into which the\n\
    \ preceding entries were inlined.\n\
    \\n\
    \ E.g., if memcpy() is inlined into printf:\n\
    \    line[0].function_name == \"memcpy\"\n\
    \    line[1].function_name == \"printf\"\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\ETX\EOT\DC2\EOT\202\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\ETX\ACK\DC2\EOT\202\SOH\v\SI\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\ETX\SOH\DC2\EOT\202\SOH\DLE\DC4\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\ETX\ETX\DC2\EOT\202\SOH\ETB\CAN\n\
    \\189\STX\n\
    \\EOT\EOT\ENQ\STX\EOT\DC2\EOT\208\SOH\STX\NAK\SUB\174\STX Provides an indication that multiple symbols map to this location's\n\
    \ address, for example due to identical code folding by the linker. In that\n\
    \ case the line information above represents one of the multiple\n\
    \ symbols. This field must be recomputed when the symbolization state of the\n\
    \ profile changes.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\EOT\ENQ\DC2\EOT\208\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\EOT\SOH\DC2\EOT\208\SOH\a\DLE\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\EOT\ETX\DC2\EOT\208\SOH\DC3\DC4\n\
    \\f\n\
    \\STX\EOT\ACK\DC2\ACK\211\SOH\NUL\218\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ACK\SOH\DC2\EOT\211\SOH\b\f\n\
    \K\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\EOT\213\SOH\STX\EM\SUB= The id of the corresponding profile.Function for this line.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\EOT\213\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\EOT\213\SOH\t\DC4\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\EOT\213\SOH\ETB\CAN\n\
    \+\n\
    \\EOT\EOT\ACK\STX\SOH\DC2\EOT\215\SOH\STX\DC1\SUB\GS Line number in source code.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ENQ\DC2\EOT\215\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\SOH\DC2\EOT\215\SOH\b\f\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ETX\DC2\EOT\215\SOH\SI\DLE\n\
    \-\n\
    \\EOT\EOT\ACK\STX\STX\DC2\EOT\217\SOH\STX\DC3\SUB\US Column number in source code.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\ENQ\DC2\EOT\217\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\SOH\DC2\EOT\217\SOH\b\SO\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\ETX\DC2\EOT\217\SOH\DC1\DC2\n\
    \\f\n\
    \\STX\EOT\a\DC2\ACK\220\SOH\NUL\232\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\a\SOH\DC2\EOT\220\SOH\b\DLE\n\
    \3\n\
    \\EOT\EOT\a\STX\NUL\DC2\EOT\222\SOH\STX\DLE\SUB% Unique nonzero id for the function.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ENQ\DC2\EOT\222\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\EOT\222\SOH\t\v\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\EOT\222\SOH\SO\SI\n\
    \e\n\
    \\EOT\EOT\a\STX\SOH\DC2\EOT\224\SOH\STX\DC1\SUB< Name of the function, in human-readable form if available.\n\
    \\"\EM Index into string table\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ENQ\DC2\EOT\224\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\SOH\DC2\EOT\224\SOH\b\f\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ETX\DC2\EOT\224\SOH\SI\DLE\n\
    \\138\SOH\n\
    \\EOT\EOT\a\STX\STX\DC2\EOT\227\SOH\STX\CAN\SUBa Name of the function, as identified by the system.\n\
    \ For instance, it can be a C++ mangled name.\n\
    \\"\EM Index into string table\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ENQ\DC2\EOT\227\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\SOH\DC2\EOT\227\SOH\b\DC3\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ETX\DC2\EOT\227\SOH\SYN\ETB\n\
    \O\n\
    \\EOT\EOT\a\STX\ETX\DC2\EOT\229\SOH\STX\NAK\SUB& Source file containing the function.\n\
    \\"\EM Index into string table\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ETX\ENQ\DC2\EOT\229\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ETX\SOH\DC2\EOT\229\SOH\b\DLE\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ETX\ETX\DC2\EOT\229\SOH\DC3\DC4\n\
    \+\n\
    \\EOT\EOT\a\STX\EOT\DC2\EOT\231\SOH\STX\ETB\SUB\GS Line number in source file.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\EOT\ENQ\DC2\EOT\231\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\a\STX\EOT\SOH\DC2\EOT\231\SOH\b\DC2\n\
    \\r\n\
    \\ENQ\EOT\a\STX\EOT\ETX\DC2\EOT\231\SOH\NAK\SYNb\ACKproto3"