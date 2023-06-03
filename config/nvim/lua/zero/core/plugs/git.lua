local icons = require("zero.core.icons")

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = icons.gitsigns.add },
        change = { text = icons.gitsigns.change },
        delete = { text = icons.gitsigns.delete },
        topdelhfe = { text = icons.gitsigns.topdelhfe },
        changedelete = { text = icons.gitsigns.changedelete },
        untracked = { text = icons.gitsigns.untracked },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      preview_config = {
        border = "rounded",
      },
    },
    keys = {
      { "<leader>gg", "<cmd>lua toggle_lazygit()<CR>", desc = "Lazygit" },
      { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
      { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
      { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
      { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
      { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
      { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
      { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
      { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
      { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
    },
  },
}
