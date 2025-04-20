return {
  'nvim-lspconfig',
  on_plugin = { 'blink.cmp' },
  after = function()
    local capabilities = require'blink.cmp'.get_lsp_capabilities()
    local lspconfig = require'lspconfig'

    lspconfig.nixd.setup{
      capabilities = capabilities,
    }
  end,
}

