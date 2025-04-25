return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		term_colors = true,
		dim_inactive = {
			enabled = true,
			percentage = 0.30,
		},
		default_integrations = false,
		integrations = {
			gitsigns = true,
			fzf = true,
			alpha = true,
			treesitter = true,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)

		vim.cmd.colorscheme("catppuccin")
	end,
}
