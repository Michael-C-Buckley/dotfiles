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
    packages = import ./nix/packages.nix {inherit inputs mkPkgs;};
  };
}
