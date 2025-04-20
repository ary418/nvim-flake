return {
  'nvim-lspconfig',
  on_plugin = { 'blink.cmp' },
  after = function()
    local capabilities = require'blink.cmp'.get_lsp_capabilities()
    local lspconfig = require'lspconfig'

    function on_lsp_attach(client, bufnr)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
      vim.keymap.set('n', 'go', vim.lsp.buf.type_definition)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references)
      vim.keymap.set('n', '<F2>', vim.lsp.buf.rename)
      vim.keymap.set('n', '<F3>', vim.lsp.buf.format)
    end

    lspconfig.nixd.setup{
      on_attach = on_lsp_attach,
      capabilities = capabilities,
    }
  end,
}

