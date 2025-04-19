{
  vimPlugins,
  ...
}: {
  # Plugins that will be symlinked in opt/ directory; loaded with lz.n.load()
  plugins = with vimPlugins; [
    lualine-nvim
    nvim-web-devicons
  ];
  # Additional packages such as LSPs
  packages = [
  ];
}

