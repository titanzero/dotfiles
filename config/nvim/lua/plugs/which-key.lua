return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		win = {
			border = "rounded"
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		{
			"<leader>H",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Buffer Global Keymaps (which-key)",
		},
	},
}
