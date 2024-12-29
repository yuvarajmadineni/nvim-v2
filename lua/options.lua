require "nvchad.options"

-- add yours here!
local o = vim.o
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 99

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
