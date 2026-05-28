{ pkgs, hpkgs }:

let
  ghc = hpkgs.ghcWithPackages (p: [
    p.lens-family
    p.pyroscope-ghc
    p.text
  ]);

  agent = pkgs.runCommand "pyroscope-ghc-test" { } ''
    mkdir -p $out/bin
    cp ${./Main.hs} Main.hs
    ${ghc}/bin/ghc \
      -O0 -threaded -with-rtsopts=-N \
      -finfo-table-map -fdistinct-constructor-tables \
      Main.hs -o $out/bin/pyroscope-ghc-test
  '';
in
pkgs.testers.nixosTest {
  name = "pyroscope-ghc";

  nodes.machine = { ... }: {
    environment.systemPackages = [ agent pkgs.curl pkgs.pyroscope ];

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
    machine.succeed(
      "PYROSCOPE_SERVER_ADDRESS=http://localhost:4040 "
      "PYROSCOPE_APPLICATION_NAME=pyroscope_ghc_test "
      "PYROSCOPE_SAMPLE_RATE=100 "
      "PYROSCOPE_UPLOAD_RATE=3 "
      "pyroscope-ghc-test 15"
    )

    machine.wait_until_succeeds(
      "profilecli query series --url=http://localhost:4040 "
      "| grep -q pyroscope_ghc_test",
      timeout=30,
    )

    profile_cmd = (
      "profilecli query profile --url=http://localhost:4040 "
      "--query='{service_name=\"pyroscope_ghc_test\"}' "
      "--from=now-5m --to=now"
    )
    try:
        machine.wait_until_succeeds(
            profile_cmd + " --function-names-only | grep -q 'Main.busyUntil'",
            timeout=60,
        )
    finally:
        # Always dump the full profile output to the test log,
        # whether the assertion passed or failed, so the captured
        # stacks are visible for inspection.
        rc, output = machine.execute(profile_cmd)
        print("profilecli query profile (rc=" + str(rc) + "):")
        print(output)
  '';
}
