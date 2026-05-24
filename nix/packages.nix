{
  inputs,
  mkPkgs,
}: let
  mkOutput = {
    file,
    host,
    pkgs,
  }:
    import ../nix/${file}.nix {
      inherit pkgs inputs;
      hostname = host;
    };
  mkSet = {
    pkgs,
    host,
  }: {
    name = host;
    value = {
      "config-${host}" = mkOutput {
        file = "config";
        inherit host pkgs;
      };
      "manifest-${host}" = pkgs.writeText "rb-manifest-${host}" (mkOutput {
        file = "manifest";
        inherit host pkgs;
      });
    };
  };
  mkSets = system: hosts: let
    pkgs = mkPkgs system;
  in
    builtins.listToAttrs (map (host: mkSet {inherit pkgs host;}) hosts);

  hosts = {
    x86_64-linux = ["x570" "t14g5" "t14"];
    aarch64-linux = ["o1"];
  };
in
  builtins.mapAttrs (n: v: mkSets n v) hosts
