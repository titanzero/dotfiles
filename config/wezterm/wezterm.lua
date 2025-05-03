local wezterm = require("wezterm")

return {
	font = wezterm.font({
		family = "Cascadia Code NF",
		weight = "Light",
	}),
	font_size = 14.5,
	color_scheme = "Catppuccin Mocha",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	},
}
