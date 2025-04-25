return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	opts = {
		options = {
			theme = "catppuccin",
			disabled_filetypes = {
				"alpha",
				"fzf"
			},
		}
	},
}
