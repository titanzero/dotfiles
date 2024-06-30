local op = vim.opt
local g = vim.g

-- Leader key
g.mapleader = " "
g.maplocalleader = " "

-- UI
op.shortmess:append("fsWcI")
op.number = true
op.relativenumber = true
op.showcmd = false
op.cmdheight = 0
op.showmode = false
op.showtabline = 0
op.splitright = true
op.splitbelow = true
op.signcolumn = "yes:1"
op.mouse = "a"
op.syntax = "off"
op.laststatus = 3
op.statuscolumn = "%=%r│%T%s"

-- Netrw improvements
g.netrw_banner = 0
g.netrw_fastbrowse = 0
g.netrw_localcopydircmd = "cp -r"
g.netrw_winsize = 30

-- Improve
op.lazyredraw = true

-- Search
op.incsearch = true
op.ignorecase = true
op.smartcase = true
op.grepformat = "%f:%l:%c:%m"
op.grepprg = "rg --vimgrep"

-- Misc
op.timeoutlen = 500
op.updatetime = 500
op.clipboard = "unnamedplus"

-- Spell
op.spelllang = "en_us"
op.spell = true

-- Disable some providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0

require("zero")
