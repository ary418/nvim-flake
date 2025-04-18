local M = {}

function M.map(mode, lhs, rhs, opts)
  if opts == nil then
    opts = {}
  end

  opts = vim.tbl_extend("keep", opts, { noremap = true, silent = true })

  vim.keymap.set(mode, lhs, rhs, opts)
end

return M

