return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "Gitsigns",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      preview_config = {
        border = "rounded",
      },
    },
    --keys = {
    --  { "<leader>gg", "<cmd>lua toggle_lazygit()<CR>", desc = "Lazygit" },
    --  { "]g", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
    --  { "[g", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
    --  { "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "Blame" },
    --  { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
    --  { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
    --  { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
    --  { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
    --  { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
    --  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
    --},
  },
}
