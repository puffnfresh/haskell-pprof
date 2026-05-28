{ mkDerivation, base, bytestring, hedgehog, http-client, http-types
, lens-family, lib, text
}:
mkDerivation {
  pname = "pyroscope-client";
  version = "0.1.0.0";
  src = ../pyroscope-client;
  libraryHaskellDepends = [
    base bytestring http-client http-types lens-family text
  ];
  testHaskellDepends = [ base bytestring hedgehog text ];
  description = "Client for the Pyroscope API";
  license = lib.licensesSpdx."Apache-2.0";
}
