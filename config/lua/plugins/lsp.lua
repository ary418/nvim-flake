return {
  'nvim-lspconfig',
  on_plugin = { 'blink.cmp' },
  after = function()
    local capabilities = require'blink.cmp'.get_lsp_capabilities()
    local lspconfig = require'lspconfig'

    lspconfig.nil_ls.setup{
      capabilities = capabilities,
    }
  end,
}

