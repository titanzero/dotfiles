--[[
╔╦╗┬ ┬┬┌─┐	┬┌─┐	┬┌┬┐	┌┬┐┬ ┬┬┌─┐	┬┌─┐	┬ ┬┬ ┬┌─┐┬─┐┌─┐  ╦	┌┐ ┌─┐┬  ┌─┐┌┐┌┌─┐
 ║ ├─┤│└─┐	│└─┐	│ │		 │ ├─┤│└─┐	│└─┐	│││├─┤├┤ ├┬┘├┤	 ║	├┴┐├┤ │  │ │││││ ┬
 ╩ ┴ ┴┴└─┘	┴└─┘	┴ ┴o	 ┴ ┴ ┴┴└─┘	┴└─┘	└┴┘┴ ┴└─┘┴└─└─┘  ╩	└─┘└─┘┴─┘└─┘┘└┘└─┘o

 Welcome to all, on my humble minimal and functional (at least for me)
 NeoVim configuration file.

 I hope you enjoy, and maybe take a change on trying out this wonderful
 world, be ready to fall into this rabbit hole...
--]]

-- Setting space as leader and local leader key
--	See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- See `:help vim.opt` for more options
--	Enable line numbers
vim.opt.number = true

-- Hide the current mode
vim.opt.showmode = false

-- Setting undo history
vim.opt.undofile = true

-- Sync clipboard between OS and NeoVim.
--	Schedule the setting after `UiEnter` because it can increase startup-time
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Searching
--	Make search case-insensitive, unless \C or capital letters in search term
--	Set grep program to ripgrep
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.grepprg = "rg --vimgrep"

-- Configure splits, let"s set some sane default, please
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key pop up sooner
vim.opt.timeoutlen = 300

-- Sets how NeoVim will display certain white space characters in the editor.
--	See `:help "list"`
--	and `:help "listchars"`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Enable some graphic and UI improvements
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.shortmess:append("fsWcI")
vim.opt.scrolloff = 10
vim.opt.showtabline = 0
vim.opt.showcmd = false
vim.opt.cmdheight = 0
vim.opt.laststatus = 3

-- Enable lazy redraw
vim.opt.lazyredraw = true

-- Enable spell checker
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Some general settings that I feel doesn't belongs to specific group
vim.opt.breakindent = true

-- Disable some providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0

-- Sets some Keymaps
-- Clear highlights on search when pressing <Esc> in normal mode
--	See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })


-- Install `lazy.nvim` plugin manager
--	See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "plugs",
	defaults = {
		lazy = false,
		version = "*", -- try installing the latest stable version for plugins that support semver
	},
	ui = {
		border = "rounded",
		size = {
			width = 0.6,
			height = 0.5,
		},
		icons = {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
	checker = {
		enabled = false,
		notify = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"netrw",
				"matchparen",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
