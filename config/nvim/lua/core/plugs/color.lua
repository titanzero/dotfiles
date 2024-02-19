return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      term_colors = true,
      dim_inactive = {
        enabled = true,
        percentage = 0.30,
      },
      integrations = {
        treesitter = true,
        gitsigns = true,
        markdown = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd.colorscheme("catppuccin")
    end,
  }
}
