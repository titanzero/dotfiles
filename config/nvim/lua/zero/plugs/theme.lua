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
--        gitsigns = true,
--        telescope = true,
--        notify = true,
--        neotree = true,
--        treesitter = true,
--        noice = true,
--        --        navic = {
--        --          enabled = false,
--        --          custom_bg = "NONE",
--        --        },
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
--        native_lsp = {
--          enabled = true,
--          virtual_text = {
--            errors = { "italic" },
--            hints = { "italic" },
--            warnings = { "italic" },
--            information = { "italic" },
--          },
--          underlines = {
--            errors = { "underline" },
--            hints = { "underline" },
--            warnings = { "underline" },
--            information = { "underline" },
--          },
--        },
--        --        barbecue = {
--        --          dim_dirname = true, -- directory name is dimmed by default
--        --          bold_basename = true,
--        --          dim_context = false,
--        --          alt_background = false,
--        --        },
--        cmp = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

