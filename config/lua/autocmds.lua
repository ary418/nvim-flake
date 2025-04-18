-- Disable folding completely
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
  command = "set nofoldenable foldmethod=manual foldlevelstart=99"
})

