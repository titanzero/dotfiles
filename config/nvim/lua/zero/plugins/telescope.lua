local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    path_display = { 'smart' },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
      },
      n = {
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      require 'telescope.themes'.get_dropdown {}
    }
  }
}

telescope.load_extension 'ui-select'
