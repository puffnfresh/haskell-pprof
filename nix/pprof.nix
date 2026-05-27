{ mkDerivation
, base
, bytestring
, containers
, hedgehog
, lib
, proto-lens
, proto-lens-runtime
, text
, transformers
, zlib
}:
mkDerivation {
  pname = "pprof";
  version = "0.1.0.0";
  src = ../pprof;
  libraryHaskellDepends = [
    base
    bytestring
    containers
    proto-lens
    proto-lens-runtime
    text
    transformers
    zlib
  ];
  testHaskellDepends = [
    base
    bytestring
    containers
    hedgehog
    proto-lens
    proto-lens-runtime
    text
    zlib
  ];
  description = "Writer for Google's pprof profile format";
  license = lib.licensesSpdx."Apache-2.0";
}
