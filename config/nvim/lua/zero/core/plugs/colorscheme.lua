return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      term_colors = true,
      dim_inactive = {
        enabled = true,
        percentage = 0.30,
      }
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd.colorscheme "catppuccin"
    end,
  }
}
