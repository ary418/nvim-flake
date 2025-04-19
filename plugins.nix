{ vimPlugins, ... }: {
  # Add plugins to load at the startup here
  start = [];
  # Add plugins to lazy-load later with `lz.n.load()` here
  opt = with vimPlugins; [
    lualine-nvim
    nvim-web-devicons
  ];
}

