-------------------------------------------------------------------------------
--                    ~~ Nicola Leonardi's VIM Configs ~~                    --
-------------------------------------------------------------------------------

---------------------------------- Nvim  Tree ---------------------------------
vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_width = 50
vim.g.nvim_tree_ignore = { '.git', 'node_modules', 'bin', 'obj' }
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_special_files = {'Makefile', 'README.md'}
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_icons = {
	default = '',
	symlink = '',
	git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
	folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
}

----------------------------------- GitSigns ----------------------------------
require('gitsigns').setup()

------------------------------------ Indent -----------------------------------
require('indent_blankline').setup{
	char = '|',
}

---------------------------------- BufferLine ---------------------------------
require('bufferline').setup {
	options = {
		separator_style = 'thin',
		offsets = {
			{
				filetype = 'NvimTree',
				text = 'File Explorer'
			}
		},
		diagnostics = 'nvim_lsp',
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = ' '
      			for e, n in pairs(diagnostics_dict) do
        			local sym = e == 'error' and ' 'or (e == 'warning' and ' ' or '' )
        	  		s = s .. n .. sym
      			end
      			return s
		end
	},
}
