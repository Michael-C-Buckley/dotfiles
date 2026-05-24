# Derivation produces the Rootbeer-derived configs
{
  pkgs,
  hostname,
  username,
  inputs,
}: let
  USER = username;
in
  pkgs.stdenv.mkDerivation {
    name = "rootbeer-configs";

    src = inputs.self;
    dontUnpack = true;
    dontExtract = true;

    inherit USER;
    LOGNAME = username;
    HOSTNAME = hostname;

    buildInputs = [
      inputs.rootbeer.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.nss_wrapper
    ];

    HOME = "/build/home/${username}";

    buildPhase = ''
      # Assemble a minimal passwd that maps the current UID
      export HOME=$(mktemp -d)
      export PASSWD_FILE=$(mktemp)
      echo "${USER}:x:$(id -u):$(id -g):${USER}:$HOME:/bin/sh" > $PASSWD_FILE

      export NSS_WRAPPER_PASSWD=$PASSWD_FILE
      export NSS_WRAPPER_GROUP=/dev/null
      export LD_PRELOAD=${pkgs.nss_wrapper}/lib/libnss_wrapper.so
      mkdir -p $out
      mkdir -p $HOME/.config/rootbeer

      # Symlink each item in the source directly, skipping the source root directory
      for item in "$src"/* "$src"/.*; do
        base=$(basename "$item")
        [ "$base" = "." ] || [ "$base" = ".." ] && continue
        ln -s "$item" "$HOME/.config/rootbeer/$base"
      done

      rb apply -p personal -f
      rm -rf $HOME/.config/rootbeer/ # Strip this repo from the output, just capture the dots
      cp -r $HOME/. $out/
    '';
  }
