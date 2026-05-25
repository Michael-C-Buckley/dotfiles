{
  inputs,
  mkPkgs,
}: let
  inherit (builtins) attrValues listToAttrs mapAttrs;
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
    };
  };
  mkSets = system: hosts: let
    pkgs = mkPkgs system;
    inherit (pkgs.lib) foldl' mergeAttrs;
  in
    foldl' mergeAttrs {} (attrValues (listToAttrs (map (host: mkSet {inherit pkgs host;}) hosts)));

  hosts = {
    x86_64-linux = ["x570" "t14g5" "t14"];
    aarch64-linux = ["o1"];
  };
in
  mapAttrs (n: v: mkSets n v) hosts
