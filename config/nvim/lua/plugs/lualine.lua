---@type LazyPluginSpec
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    options = {
      theme = "catppuccin",
      disabled_filetypes = {
        "snacks_dashboard",
        "snacks_picker_input",
      },
    }
  },
}
