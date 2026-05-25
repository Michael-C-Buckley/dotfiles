# Derivation produces the Rootbeer-derived configs
{
  inputs,
  pkgs,
  hostname,
  username ? "michael",
}: let
  USER = username;
in
  pkgs.stdenv.mkDerivation {
    name = "rootbeer-configs";

    src = ../.;
    dontUnpack = true;
    dontExtract = true;

    inherit USER;
    LOGNAME = username;
    HOSTNAME = hostname;

    buildInputs = builtins.attrValues {
      rb = inputs.rootbeer.packages.${pkgs.stdenv.hostPlatform.system}.default;
      inherit
        (pkgs)
        nss_wrapper
        fd
        jq
        nix
        ;
    };

    HOME = "/build/home/${username}";

    buildPhase = ''
      # Assemble a minimal passwd that maps the current UID
      export HOME=$out
      TMPDIR=$(mktemp -d)
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
      rm -rf $out/.config/rootbeer/ # Strip this repo from the output, just capture the dots

      # Create the manifest - cd in order to most easily get the relative paths
      cd "$HOME"
      fd -L -H . --type f | jq -R -s --arg out "$out" --arg user "${USER}" '{
        clobber_by_default: false,
        version: 3,
        files: (
          split("\n") |
          map(select(length > 0)) |
          map({
            target: "/home/\($user)/" + .,
            source: "\($out)/" + .,
            type: "symlink"
          })
        )
      }' > $out/manifest.json

      # Create a nix manifest
      cp $out/manifest.json $TMPDIR/manifest.json
      nix eval --impure --expr "builtins.toJSON(builtins.readFile \"$TMPDIR/manifest.json\")" --extra-experimental-features nix-command > $out/default.nix
    '';
  }
