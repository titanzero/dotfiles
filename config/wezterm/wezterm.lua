local wezterm = require 'wezterm'
local catppuccin = require 'colors.catppuccin'.setup {
	sync = false,
	flavour = 'frappe'
}

return {
	colors = catppuccin,
	font = wezterm.font('CaskaydiaCove Nerd Font Mono', { weight = 'Light' }),
	font_size = 14,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	},
	initial_rows = 35,
	initial_cols = 180,
	use_fancy_tab_bar = false
}
