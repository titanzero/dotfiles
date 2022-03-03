---
-- UI main settings
---

vim.cmd [[colorscheme catppuccin]]

require 'nvim-autopairs'.setup()
require 'lspkind'.init()
require 'colorizer'.setup()
require 'indent_blankline'.setup({
  show_current_context = true,
  show_current_context_start = true,
  filetype_exclude = { 'help', 'packer', 'startup' },
})
