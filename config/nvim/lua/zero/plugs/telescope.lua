return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    opts = {
      defaults = {
        file_ignore_patterns = require("zero.utils.ignore"),
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "   ",
        dynamic_preview_title = true,
        hl_result_eol = true,
        sorting_strategy = "ascending",
        results_title = "",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.80,
          height = 0.60,
          preview_cutoff = 120,
        },
      },
    },
    keys = {
      -- File search && Fuzzy
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Open buffers" },
      -- Git
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
      -- Helps
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help tags" },
    },
  },
}
