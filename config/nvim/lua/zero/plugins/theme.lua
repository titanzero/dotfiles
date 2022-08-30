vim.g.catppuccin_flavour = 'macchiato'

require 'catppuccin'.setup {
  term_colors = true,
  compile = {
    enable = true
  },
  styles = {
    comments = {},
  },
  integrations = {
    telescope = true,
    nvimtree = true,
    gitsigns = true,
    indent_blankline = {
      enabled = true,
    }
  },
}

vim.api.nvim_command 'colorscheme catppuccin'
