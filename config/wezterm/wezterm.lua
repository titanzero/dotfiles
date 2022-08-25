local wezterm = require 'wezterm'
local catppuccin = require 'colors.catppuccin'.setup {
}

local is_windows = package.config:sub(1, 1) == '\\'
local start_command = is_windows and { 'pwsh.exe', '-NoLogo' } or { 'zsh' }

return {
	colors = catppuccin,
	font = wezterm.font('CaskaydiaCove Nerd Font Mono', { weight = 'Light' }),
	font_size = is_windows and 11 or 14,
	default_prog = start_command,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	},
	initial_rows = 35,
	initial_cols = 180,
	use_fancy_tab_bar = false,
	window_close_confirmation = 'NeverPrompt'
}
