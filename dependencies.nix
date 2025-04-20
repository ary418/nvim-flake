{pkgs, ...}: {
  # Plugins that will be symlinked in opt/ directory; loaded with lz.n.load()
  plugins = with pkgs.vimPlugins; [
    lualine-nvim
    nvim-web-devicons

    nvim-treesitter.withAllGrammars

    nvim-lspconfig
    blink-cmp
    friendly-snippets

    none-ls-nvim
  ];
  # Additional packages such as
  # LSPs, formatters, linters, static analysis tools
  packages = with pkgs; [
    nixd
    statix
    deadnix
  ];
}
