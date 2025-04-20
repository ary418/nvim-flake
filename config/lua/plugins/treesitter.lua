return {
  'nvim-treesitter',
  event = 'FileType',
  after = function()
    require'nvim-treesitter.configs'.setup {
      auto_install = false,
      highlight = {
        enable = true,
      },
    }
  end,
}

