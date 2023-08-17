return {
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {
      input = {
        border = "rounded",
        win_options = { winblend = 0 },
      },
      -- select = {
      --   telescope = require("telescope.themes")["get_cursor"]({
      --   cwd = utils.get_root(),
      -- }) },
    },
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
}
