require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("n", "<S-k>", function()
  vim.lsp.buf.hover()
end, { desc = "Hover definition" })

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<leader>fr", function()
  require("telescope.builtin").lsp_references()
end, { desc = "Telescope" })
map("n", "<leader>h", "")
map("n", "<C-cc>", "")
map("n", "<C-c>", "<Esc>")
map("n", "<leader>w", function()
  require("nvchad.tabufline").closeAllBufs()
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<C-k>", ":TmuxNavigateUp<CR>")
map("n", "<C-j>", ":TmuxNavigateDown<CR>")
map("n", "<C-h>", ":TmuxNavigateLeft<CR>")
map("n", "<C-l>", ":TmuxNavigateRight<CR>")
