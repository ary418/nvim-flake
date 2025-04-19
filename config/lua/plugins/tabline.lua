require('lz.n').load({
  'lualine.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-web-devicons' },
  after = function()
    require('lualine').setup {
      options = {
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = ' ', right = ' ' },
      },
      sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1,3) end } },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
})

