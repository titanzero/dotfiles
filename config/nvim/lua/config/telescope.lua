---
-- Telescope config
---

local actions = require 'telescope.actions'

require 'telescope'.setup({
  defaults = {
    file_ignore_patterns = {
      'node_modules', 'bin', 'obj', 'debug', '.git'
    },
    mappings = {
      i = {
        ['<esc>'] = actions.close
      }
    },
    layout_strategy = 'vertical',
    layout_config = {
      height = 0.75,
      width = 0.5
    }
  }
})
