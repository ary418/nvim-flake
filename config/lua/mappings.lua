local x = require("libx")

-- Better navigation in wrapped lines
for _, motion in ipairs({ "j", "k", "<Down>", "<Up>" }) do
  x.map({ "n", "x" }, motion, function()
     return vim.v.count > 0 and motion or "g"..motion
  end, { expr = true })
end

-- Disable skill issues
--for _, key in ipairs({ "<Left>", "<Right>", "<Up>", "<Down>" }) do
--  x.map({ "n", "i", "x" }, key, function() print("skill issue?") end)
--end

-- No highlight search results
x.map("n", "<Esc>", "<CMD>noh<CR>")

-- Better indenting
x.map("v", "<Tab>", ">gv")
x.map("v", "<S-Tab>", "<gv")

-- Move selected line / block of text in visual mode
x.map("v", "K", "<-2<CR>gv=gv")
x.map("v", "J", ">+1<CR>gv=gv")

