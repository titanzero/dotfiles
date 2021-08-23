-------------------------------------------------------------------------------
--                    ~~ Nicola Leonardi's VIM Configs ~~                    --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--                                 UI Config                                 --
-------------------------------------------------------------------------------

------------------------------ General  Settings ------------------------------
vim.o.clipboard = 'unnamedplus'  -- Use system clipboard
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.hidden = true  -- Switch buffer without saving
vim.o.mouse = 'a'
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50
vim.o.updatetime = 100
vim.o.fileformat = 'unix'
vim.o.encoding = 'UTF-8'
vim.o.spelllang = 'en'
vim.o.undofile = true
vim.o.completeopt = 'menuone,noselect,preview'
vim.o.shortmess = vim.o.shortmess .. 'c'
-- vim.o.colorcolumn = '80'

------------------------------ Tabs & Indentation -----------------------------
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 0

---------------------------------- Appearance ---------------------------------
vim.o.background = 'dark'
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 1
vim.o.showmode = false
vim.o.sidescrolloff = 5
vim.o.termguicolors = true
vim.o.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = {
  extends = "›",
  precedes = "‹",
  nbsp = "·",
  tab = "→ ",
  trail = "·"
}

---------------------------------- Nvim  Tree ---------------------------------
vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_width = 50
vim.g.nvim_tree_ignore = { '.git', 'node_modules' }
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
