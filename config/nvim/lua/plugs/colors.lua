return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    term_colors = true,
    dim_inactive = {
      enabled = true,
      percentage = 0.30,
    },
    default_integrations = false,
    integrations = {
      cmp = true,
      treesitter = true,
      treesitter_context = true,
      gitsigns = true,
      snacks = {
        enabled = true,
        indent_scope_color = "lavender",
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd.colorscheme("catppuccin")
  end,
}
