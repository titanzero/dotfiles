local config = require("wezterm")

return {
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
  	initial_cols = 120,
  	initial_rows = 28,
  	font = config.font("IoskeleyMono Nerd Font Mono"),
  	font_size = 14,
	color_scheme = "Catppuccin Mocha",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}
