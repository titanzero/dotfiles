return {
  ---@type LazyPluginSpec
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    ---@module 'catppuccin'
    ---@type CatppuccinOptions
    opts = {
      term_colors = true,
      dim_inactive = {
        enabled = true,
        percentage = 0.30,
      },
      default_integrations = false,
      integrations = {
        mason = true,
        fidget = true,
        treesitter = true,
        treesitter_context = true,
        snacks = {
          enabled = true,
          indent_scope_color = "lavender",
        },
        cmp = true,
        blink_cmp = {
          style = "borderer",
        },
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "onsails/lspkind.nvim",
    lazy = true,
    config = true,
  },
}
