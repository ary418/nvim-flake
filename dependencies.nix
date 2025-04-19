{
  vimPlugins,
  # LSPs
  nil,
  ...
}: {
  # Plugins that will be symlinked in opt/ directory; loaded with lz.n.load()
  plugins = with vimPlugins; [
    lualine-nvim
    nvim-web-devicons

    nvim-treesitter.withAllGrammars

    nvim-lspconfig
    blink-cmp
    friendly-snippets
  ];
  # Additional packages such as LSPs
  packages = [
    nil
  ];
}

