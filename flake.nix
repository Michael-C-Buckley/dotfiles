{
  description = "Michael's User Dotfiles and Apps";

  inputs = {
    nixpkgs.follows = "rootbeer/nixpkgs";
    rootbeer.url = "github:michael-c-buckley/rootbeer";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    eachSystem = nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
    mkPkgs = system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
  in {
    devShells = eachSystem (system: {
      default = import ./shell.nix {pkgs = mkPkgs system;};
    });
    packages = eachSystem (system: let
      pkgs = mkPkgs system;
    in {
      # package to deploy the configs use SMFH
      # TODO: dynamically discover and generate from hosts
      configs = import ./nix/configs.nix {
        inherit pkgs inputs;
        hostname = "x570";
      };
      # SMFH-compatible manifest for use with Hjem in NixOS systems
      manifest = pkgs.writeText "rb-manifest" (import ./nix/manifest.nix {
        inherit inputs pkgs;
        hostname = "x570";
      });
    });
  };
}
