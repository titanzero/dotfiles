return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{ "<leader>ff", ":FzfLua files<cr>", desc = "FzfLua list files" },
		{ "<leader>fg", ":FzfLua live_grep_native<cr>", desc = "FzfLua grep into files" },
		{ "<leader>bg", ":FzfLua lgrep_curbuf<cr>", desc = "FzfLua grep into local buffer" },
		{ "<leader>fb", ":FzfLua buffers<cr>", desc = "FzfLua list buffers" },
		{ "<leader>fh", ":FzfLua help_tags<cr>", desc = "FzfLua show help tags" },
		{ "z=", ":FzfLua spell_suggest<cr>", desc = "FzfLua language suggest" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	opts = {
		winopts = {
			preview = {
				default = "bat",
			},
		},
	},
}
