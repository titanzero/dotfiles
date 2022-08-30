require 'gitsigns'.setup {
  watch_gitdir = {
    interval = 100,
    follow_files = true
  },
  preview_config = {
    border = 'rounded',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  signcolumn = true,
  current_line_blame = false,
  current_line_blame_opts = {
    irt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
}
