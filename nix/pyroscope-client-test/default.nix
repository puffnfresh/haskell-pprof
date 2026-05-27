{ pkgs, hpkgs }:

let
  ghc = hpkgs.ghcWithPackages (p: [
    p.lens-family
    p.pprof
    p.pyroscope-client
    p.text
    p.time
  ]);

  test = pkgs.runCommand "pyroscope-client-test" { } ''
    mkdir -p $out/bin
    ${ghc}/bin/ghc -O0 ${./Main.hs} -o $out/bin/pyroscope-client-test
  '';
in
pkgs.testers.nixosTest {
  name = "pyroscope-client";

  nodes.machine = { ... }: {
    environment.systemPackages = [ test pkgs.curl ];

    services.pyroscope = {
      enable = true;
      settings.server.http_listen_address = "0.0.0.0";
    };
  };

  testScript = ''
    machine.start()
    machine.wait_for_unit("pyroscope.service")
    machine.wait_for_open_port(4040)
    machine.wait_until_succeeds("curl -fsS http://localhost:4040/ready")
    machine.succeed("pyroscope-client-test http://localhost:4040 pyroscope-client-test")
  '';
}
