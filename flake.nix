{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, treefmt-nix }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
      pkgsFor = system: nixpkgs.legacyPackages.${system};
      hpkgsFor = system:
        let
          pkgs = pkgsFor system;
          ghcIpe = pkgs.haskell.compiler.ghc9141.overrideAttrs (old: {
            hadrianFlags = (old.hadrianFlags or [ ]) ++ [
              "*.*.ghc.hs.opts += -finfo-table-map -fdistinct-constructor-tables"
            ];
          });
          withIpe = drv: pkgs.haskell.lib.appendConfigureFlags drv [
            "--ghc-option=-finfo-table-map"
            "--ghc-option=-fdistinct-constructor-tables"
          ];
          isHaskellPackage = pkg:
            pkgs.lib.isDerivation pkg
            && (pkg.override.__functionArgs or { }) ? mkDerivation;
        in
        (pkgs.haskell.packages.ghc9141.override {
          ghc = ghcIpe;
        }).extend (hself: hsuper:
          let
            overrides = {
              pprof = hself.callCabal2nix "pprof" ./pprof { };
              ghc-pprof = hself.callCabal2nix "ghc-pprof" ./ghc-pprof { };
              lens-family-core = pkgs.haskell.lib.doJailbreak hsuper.lens-family-core;
              lens-family = pkgs.haskell.lib.doJailbreak hsuper.lens-family;
              proto-lens = pkgs.haskell.lib.doJailbreak hsuper.proto-lens;
              proto-lens-runtime = pkgs.haskell.lib.doJailbreak hsuper.proto-lens-runtime;
              hs-opentelemetry-api = pkgs.haskell.lib.doJailbreak hsuper.hs-opentelemetry-api;
              hs-opentelemetry-sdk = pkgs.haskell.lib.doJailbreak hsuper.hs-opentelemetry-sdk;
              rebase = pkgs.haskell.lib.doJailbreak hsuper.rebase;
              rerebase = pkgs.haskell.lib.doJailbreak hsuper.rerebase;
            };
          in
          pkgs.lib.mapAttrs
            (_: pkg: if isHaskellPackage pkg then withIpe pkg else pkg)
            (hsuper // overrides));
      treefmtFor = system:
        (treefmt-nix.lib.evalModule (pkgsFor system) {
          programs.ormolu.enable = true;
          programs.nixpkgs-fmt.enable = true;
          settings.global.excludes = [ "pprof/src/Proto/**" ];
        }).config.build.wrapper;
    in
    {
      packages = forAllSystems (system:
        let hpkgs = hpkgsFor system; in {
          pprof = hpkgs.pprof;
          ghc-pprof = hpkgs.ghc-pprof;
          default = hpkgs.ghc-pprof;
        });

      formatter = forAllSystems treefmtFor;

      devShells = forAllSystems (system:
        let
          pkgs = pkgsFor system;
          hpkgs = hpkgsFor system;
        in
        {
          default = hpkgs.shellFor {
            packages = p: [ p.pprof p.ghc-pprof ];
            nativeBuildInputs = [
              hpkgs.cabal-install
              hpkgs.proto-lens-protoc
              pkgs.protobuf
              (treefmtFor system)
            ];
          };
        });
    };
}
