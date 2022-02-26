--
-- Git main config
--

require 'gitsigns'.setup({
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 100,
    ignore_whitespace = true
  }
})
