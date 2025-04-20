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

    fzf-lua

    leap-nvim
    vim-repeat
  ];
  # Additional packages such as
  # runtime dependencies, LSPs, formatters, linters, static analysis tools
  packages = with pkgs; [
    fzf
    bat
    ripgrep
    fd

    nixd
    statix
    deadnix
  ];
}
