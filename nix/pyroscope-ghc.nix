{ mkDerivation
, base
, ghc-pprof
, http-client
, lens-family
, lib
, pprof
, pyroscope-client
, text
}:
mkDerivation {
  pname = "pyroscope-ghc";
  version = "0.1.0.0";
  src = ../pyroscope-ghc;
  libraryHaskellDepends = [
    base
    ghc-pprof
    http-client
    lens-family
    pprof
    pyroscope-client
    text
  ];
  description = "Pyroscope agent for GHC applications";
  license = lib.licensesSpdx."Apache-2.0";
}
