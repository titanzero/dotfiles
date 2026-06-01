-- ~/.config/nvim/plugin/catppuccin.lua

vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
  flavour  = "mocha",
  background = {
    light = "latte",
    dark  = "mocha",
  },

  compile_path        = vim.fn.stdpath("cache") .. "/catppuccin",
  transparent_background = false,
  term_colors         = true,

  float = {
    transparent = false,
    solid       = false,
  },

  dim_inactive = {
    enabled    = false,
    shade      = "dark",
    percentage = 0.15,
  },

  styles = {
    comments    = { "italic" },
    conditionals = { "italic" },
    keywords    = {},
    functions   = {},
    strings     = {},
    variables   = {},
    numbers     = {},
    booleans    = {},
    properties  = {},
    types       = {},
    operators   = {},
    miscs       = {},
  },

  lsp_styles = {
    virtual_text = {
      errors      = { "italic" },
      hints       = { "italic" },
      warnings    = { "italic" },
      information = { "italic" },
    },
    underlines = {
      errors   = { "underline" },
      warnings = { "underline" },
      hints    = {},
      information = {},
    },
    inlay_hints = {
      background = true,
    },
  },

  color_overrides = {},
  highlight_overrides = {},
})

-- v2.0.0: colorscheme renamed to avoid conflict with the new
-- Vim built-in catppuccin port
vim.cmd.colorscheme("catppuccin-nvim")
