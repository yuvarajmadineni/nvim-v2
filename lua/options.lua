require "nvchad.options"

-- add yours here!
local o = vim.o
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
