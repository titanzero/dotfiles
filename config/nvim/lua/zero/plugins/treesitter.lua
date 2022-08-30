require 'nvim-treesitter.configs'.setup {
  additional_vim_regex_highlighting = false,
  highlight = {
    enable = true,
  },
  ensure_installed = {
    'lua', 'markdown', 'json', 'yaml', 'c_sharp'
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
  },
}
