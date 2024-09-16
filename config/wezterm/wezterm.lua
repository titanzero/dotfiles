local wezterm = require('wezterm')
local config = {}

return {
  font_size = 14,
  line_height = 1.3,
  font = wezterm.font('Cascadia Code', { weight = 'Light' }),
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  initial_rows = 30,
  initial_cols = 180,
  colors = {
    foreground = "#ffffff",
    background = "#16181a",

    cursor_bg = "#ffffff",
    cursor_fg = "#16181a",
    cursor_border = "#ffffff",

    selection_fg = "#ffffff",
    selection_bg = "#3c4048",

    scrollbar_thumb = "#16181a",
    split = "#16181a",

    ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
    brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
    indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
  }
}
