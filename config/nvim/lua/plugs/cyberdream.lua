return {
	"scottmckendry/cyberdream.nvim",
	priority = 1000,
	opts = {
		italic_comments = true,
		cache = true,
		extensions = {
			fzflua = true,
			lazy = true,
			whichkey = true,
		},
	},
	init = function()
		-- Actually load colorscheme here

		vim.cmd.colorscheme("cyberdream")
	end,
}
