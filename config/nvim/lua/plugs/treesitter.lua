return {
	"nvim-treesitter/nvim-treesitter",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	lazy = true,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"lua",
				"vim",
				"markdown",
				"markdown_inline",
				"c_sharp",
			},
		})
	end,
}
