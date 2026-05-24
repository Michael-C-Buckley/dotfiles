# Finalize the manifest.json needed for smfh to link the files
{
  inputs,
  pkgs,
  hostname,
  username ? "michael",
}: let
  dir = import ./configs.nix {
    inherit pkgs hostname username inputs;
  };
in
  builtins.toJSON {
    files = import ./findFiles.nix {inherit dir username;};
    clobber_by_default = false;
    version = 3;
  }
