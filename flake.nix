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

      mkLocals = withIpe: hself: {
        pprof = withIpe (hself.callPackage ./nix/pprof.nix { });
        ghc-pprof = withIpe (hself.callPackage ./nix/ghc-pprof.nix { });
        pyroscope-client = withIpe (hself.callPackage ./nix/pyroscope-client.nix { });
        pyroscope-ghc = withIpe (hself.callPackage ./nix/pyroscope-ghc.nix { });
      };

      mkJailbreaks = pkgs: hsuper: {
        lens-family-core = pkgs.haskell.lib.doJailbreak hsuper.lens-family-core;
        lens-family = pkgs.haskell.lib.doJailbreak hsuper.lens-family;
        proto-lens = pkgs.haskell.lib.doJailbreak hsuper.proto-lens;
        proto-lens-runtime = pkgs.haskell.lib.doJailbreak hsuper.proto-lens-runtime;
        hs-opentelemetry-api = pkgs.haskell.lib.doJailbreak hsuper.hs-opentelemetry-api;
        hs-opentelemetry-sdk = pkgs.haskell.lib.doJailbreak hsuper.hs-opentelemetry-sdk;
        rebase = pkgs.haskell.lib.doJailbreak hsuper.rebase;
        rerebase = pkgs.haskell.lib.doJailbreak hsuper.rerebase;
      };

      hpkgsFor = system:
        let pkgs = pkgsFor system; in
        pkgs.haskell.packages.ghc9141.extend (hself: hsuper:
          mkJailbreaks pkgs hsuper // mkLocals (drv: drv) hself);

      hpkgsIpeFor = system:
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
          hpkgsIpe = pkgs.haskell.packages.ghc9141.override {
            ghc = ghcIpe;
            buildHaskellPackages = hpkgsIpe;
          };
        in
        hpkgsIpe.extend
          (hself: hsuper: mkJailbreaks pkgs hsuper // mkLocals withIpe hself);

      treefmtFor = system:
        (treefmt-nix.lib.evalModule (pkgsFor system) {
          programs.ormolu.enable = true;
          programs.nixpkgs-fmt.enable = true;
          settings.global.excludes = [ "pprof/src/Proto/**" ];
        }).config.build.wrapper;
    in
    {
      packages = forAllSystems (system:
        let
          hpkgs = hpkgsFor system;
          hpkgsIpe = hpkgsIpeFor system;
        in
        {
          pprof = hpkgs.pprof;
          ghc-pprof = hpkgs.ghc-pprof;
          pyroscope-client = hpkgs.pyroscope-client;
          pyroscope-ghc = hpkgs.pyroscope-ghc;

          pprof-ipe = hpkgsIpe.pprof;
          ghc-pprof-ipe = hpkgsIpe.ghc-pprof;
          pyroscope-client-ipe = hpkgsIpe.pyroscope-client;
          pyroscope-ghc-ipe = hpkgsIpe.pyroscope-ghc;

          default = hpkgs.ghc-pprof;
        });

      checks = forAllSystems (system:
        let
          pkgs = pkgsFor system;
          hpkgs = hpkgsFor system;
          hpkgsIpe = hpkgsIpeFor system;
        in
        pkgs.lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
          pyroscope-client-test = import ./nix/pyroscope-client-test {
            inherit pkgs hpkgs;
          };
          pyroscope-ghc-test = import ./nix/pyroscope-ghc-test {
            inherit pkgs;
            hpkgs = hpkgsIpe;
          };
        });

      formatter = forAllSystems treefmtFor;

      devShells = forAllSystems (system:
        let
          pkgs = pkgsFor system;
          hpkgs = hpkgsFor system;
        in
        {
          default = hpkgs.shellFor {
            packages = p: [ p.pprof p.ghc-pprof p.pyroscope-client p.pyroscope-ghc ];
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
