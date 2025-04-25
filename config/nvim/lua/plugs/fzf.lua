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
		manpages = {
			previewer = "man_native"
		},
		helptags = {
			previewer = "help_native"
		},
		lsp = {
			code_actions = {
				previewer = "codeaction_native"
			},
		},
		tags = {
			previewer = "bat"
		},
		btags = {
			previewer = "bat"
		},
		previewers = {
			bat = {
				cmd = "bat",
				args = "--tabs=1 --color=always"
			},
		},
	},
}
