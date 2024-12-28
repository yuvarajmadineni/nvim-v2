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

-- harpoon marks
map("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add mark" })
map("n", "<leader>hh", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Navigate to mark" })
map("n", "<leader>hl", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Navigate to previous mark" })
map("n", "<leader>ho", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Toggle quick menu" })

-- autosession mappings
map("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
map("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
