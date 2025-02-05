return {
	"lukas-reineke/indent-blankline.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	config = true,
}
