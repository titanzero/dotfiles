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
			treesitter = true,
		},
	},
	init = function()
		-- Actually load colorscheme here

		vim.cmd.colorscheme("cyberdream")
	end,
}
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	opts = {
-- 		term_colors = true,
-- 		dim_inactive = {
-- 			enabled = true,
-- 			percentage = 0.30,
-- 		},
-- 		integrations = {
-- 			fzf = true,
-- 			treesitter = true,
-- 			indent_blankline = {
-- 				enabled = true,
-- 				colored_indent_levels = false,
-- 			},
-- 			native_lsp = {
-- 				enabled = true,
-- 				virtual_text = {
-- 					errors = { "italic" },
-- 					hints = { "italic" },
-- 					warnings = { "italic" },
-- 					information = { "italic" },
-- 				},
-- 				underlines = {
-- 					errors = { "underline" },
-- 					hints = { "underline" },
-- 					warnings = { "underline" },
-- 					information = { "underline" },
-- 				},
-- 			},
-- 			cmp = true,
-- 		},
-- 	},
-- 	config = function(_, opts)
-- 		require("catppuccin").setup(opts)
--
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }
