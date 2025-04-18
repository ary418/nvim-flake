{
  description = "my personal Neovim config flake :D";

  outputs = { self, nixpkgs, neovim-overlay }: let
    eachSystem = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.all;
  in {
    packages = eachSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      neovim-custom = pkgs.callPackage ./. {
        neovim-unwrapped = neovim-overlay.packages.${system}.default;
      };
    in {
      default = neovim-custom;
    });
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  nixConfig = {
    substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}

