{
  description = "Michael's User Dotfiles and Apps";

  inputs = {
    nixpkgs.follows = "rootbeer/nixpkgs";
    rootbeer.url = "github:michael-c-buckley/rootbeer";
  };

  outputs = {
    self,
    nixpkgs,
    rootbeer,
  } @ inputs: let
    eachSystem = nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
    mkPkgs = system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    flake = {
      configs = ./configs;
      hosts = ./hosts;
      media = ./media;
      modules = ./modules;
    };
  in {
    devShells = eachSystem (system: {
      default = import ./shell.nix {pkgs = mkPkgs system;};
    });
    packages = eachSystem (system: let
      pkgs = mkPkgs system;
    in {
      # Wrapped editors I use
      helix = import ./nix/hx.nix {inherit self pkgs;};
      nvim = "";

      # package to deploy the configs use SMFH
      configs = import ./nix/configs.nix {
        inherit pkgs inputs;
        hostname = "x570";
        username = "michael";
      };
      # SMFH-compatible manifest for use with Hjem in NixOS systems
      manifest = "";
    });
  };
}
