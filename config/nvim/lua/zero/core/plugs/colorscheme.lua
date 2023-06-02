return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      term_colors = true,
      dim_inactive = {
        enabled = true,
        percentage = 0.30,
      },
      integrations = {
        gitsigns = true,
        telescope = true,
        notify = true,
        neotree = true,
        treesitter = true,
        noice = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
      }
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd.colorscheme "catppuccin"
    end,
  }
}
