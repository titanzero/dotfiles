---
-- TreeSitter main config
---

require 'nvim-treesitter.configs'.setup({
  ensure_installed = { 'lua', 'markdown', 'c', 'cpp', 'c_sharp', 'make', 'yaml' },
  highlight = {
    enable = true
  },
  refactor = {
    highlight_definitions = {
      enable = true
    },
    highlight_current_scope = {
      enable = true
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = 'rn'
      }
    }
  }
})

require 'treesitter-context'.setup({
  enable = true
})
