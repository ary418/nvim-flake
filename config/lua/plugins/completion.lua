return {

{
  'friendly-snippets',
  dep_of = { 'blink.cmp' },
},
{
  'blink.cmp',
  after = function()
    vim.diagnostic.config{
      update_in_insert = true,
      severity_sort = true,
    }

    require'blink.cmp'.setup {
      keymap = { preset = 'enter' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      signature = { enabled = true },
    }
  end,
}

}

