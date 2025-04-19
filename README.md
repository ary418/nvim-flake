# Minimal Neovim flake

> [!WARNING]
> This project is a WIP and is not well documented.
> For now, the Neovim wrapper, basic options,
> and partially the README have been completed.

## Philosophy

- Manage plugins and external dependencies using Nix and lazy-load with lz.n
- Configuration entirely in Lua
- Utilizes Neovim's built-in LSP client, with Nix managing language servers
- Usable on any device with Nix installed, regardless of system settings
- Uses a minimal set of plugins and leverages the latest capabilities of Neovim's nightly versions

## Test drive

If you have Nix installed (with [flakes](https://wiki.nixos.org/wiki/Flakes) enabled), you can test drive this by running:
```bash
$ nix run github:ary418/nvim-flake
```

## Installation

Here's an example of minimal flake using this config

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Optionally, use a local path or your own fork for development
    #nvim-flake.url = "git+file:///path/to/local/repo";
    nvim-flake.url = "github:ary418/nvim-flake";
  };
  outputs = { nixpkgs, nvim-flake }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; lib = nixpkgs.lib; };
      modules = [
        (
          { inputs, pkgs, ... }:
          {
            environment.systemPackages = [
              inputs.nvim-flake.packages.${pkgs.system}.default
            ];
          }
        )
      ];
    };
  };
}
```

## Configure

Fork this repository 

## Nix-generated plugins

You can extend the default configuration by overriding the extraPlugins attribute. This allows you to add custom plugins that can utilize configuration options from your local setup.

For an example, let's configure mini.base16 with colors of Stylix

```nix
inputs.nvim-flake.packages.${pkgs.system}.default.override {
  extraPlugins = [
    pkgs.vimPlugins.mini-base16
    (pkgs.runCommandLocal "mini-base16-stylix" {} ''
      mkdir -pv $out/plugin
      tee $out/plugin/init.lua <<EOF
        require('mini.base16').setup {
          palette = {
          ${
            lib.concatMapAttrsStringSep
            "\n"
            (name: value: "${name} = '${value}',")
            (
              lib.filterAttrs
              (name: value:
                (lib.hasPrefix "base" name)
                && (builtins.stringLength name) == 6
              )
              config.lib.stylix.colors.withHashtag
            )
          }
          },
        }
      EOF
    '')
  ];
}
```

## Credit

This flake was made following this awesome guide: https://ayats.org/blog/neovim-wrapper

