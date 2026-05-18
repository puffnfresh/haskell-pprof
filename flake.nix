{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, treefmt-nix }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
      pkgsFor = system: nixpkgs.legacyPackages.${system};
      pprofFor = system:
        (pkgsFor system).haskellPackages.callCabal2nix "pprof" ./. { };
      treefmtFor = system:
        (treefmt-nix.lib.evalModule (pkgsFor system) {
          programs.ormolu.enable = true;
          programs.nixpkgs-fmt.enable = true;
          settings.global.excludes = [ "src/Proto/**" ];
        }).config.build.wrapper;
    in
    {
      packages = forAllSystems (system: {
        default = pprofFor system;
      });

      devShells = forAllSystems (system:
        let
          pkgs = pkgsFor system;
          hpkgs = pkgs.haskellPackages;
        in
        {
          default = hpkgs.shellFor {
            packages = _: [ (pprofFor system) ];
            nativeBuildInputs = [
              hpkgs.cabal-install
              hpkgs.proto-lens-protoc
              pkgs.protobuf
              (treefmtFor system)
            ];
          };
        });

      formatter = forAllSystems treefmtFor;
    };
}
