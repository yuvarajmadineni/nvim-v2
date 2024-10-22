return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      current_line_blame = false,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        -- Actions
        -- map("n", "[c", ":Gitsigns next_hunk<CR>", { desc = "Git signs next_hunk" })
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
        map("n", "<leader>hS", gs.stage_buffer, { desc = "Git signs stage buffer" })
        map("n", "<leader>ha", gs.stage_hunk, { desc = "Git signs stage hunk" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git signs undo stage hunk" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Git signs reset buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Git signs previous hunk" })
        map("n", "<leader>hb", function()
          gs.blame_line { full = true }
        end, { desc = "Git signs" })
        map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Git signs toggle line blame" })
        map("n", "<leader>hd", gs.diffthis, { desc = "Diff" })
        map("n", "<leader>hD", function()
          gs.diffthis "~"
        end, { desc = "Git signs" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    }
  end,
}
