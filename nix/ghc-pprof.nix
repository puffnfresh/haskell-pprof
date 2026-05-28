{ mkDerivation, base, bytestring, containers, hedgehog
, hs-opentelemetry-api, hs-opentelemetry-sdk, lib, memory, pprof
, text, time
}:
mkDerivation {
  pname = "ghc-pprof";
  version = "0.1.0.0";
  src = ../ghc-pprof;
  libraryHaskellDepends = [
    base bytestring containers hs-opentelemetry-api memory pprof text
    time
  ];
  testHaskellDepends = [
    base bytestring hedgehog hs-opentelemetry-api hs-opentelemetry-sdk
  ];
  description = "Live pprof profiles of a running GHC application";
  license = lib.licensesSpdx."Apache-2.0";
}
