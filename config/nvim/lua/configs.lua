-- init.lua
package.path              = package.path
    .. ";" .. vim.fn.expand("~/.luarocks/share/lua/5.1/?.lua")
    .. ";" .. vim.fn.expand("~/.luarocks/share/lua/5.1/?/init.lua")

package.cpath             = package.cpath
    .. ";" .. vim.fn.expand("~/.luarocks/lib/lua/5.1/?.so")

-- ~/.config/nvim/lua/configs.lua
local opt                 = vim.opt
local g                   = vim.g

g.mapleader               = " "
g.maplocalleader          = " "

-- UI
opt.number                = true
opt.relativenumber        = true
opt.numberwidth           = 2
opt.cursorline            = true
opt.wrap                  = false
opt.scrolloff             = 8
opt.signcolumn            = "yes:1"
opt.termguicolors         = true
opt.winborder             = "rounded"
opt.splitbelow            = true
opt.splitright            = true

-- Editing
opt.expandtab             = true
opt.tabstop               = 4
opt.softtabstop           = 4
opt.shiftwidth            = 4
opt.shiftround            = true
opt.autoindent            = true

-- Search
opt.ignorecase            = true
opt.smartcase             = true
opt.hlsearch              = true
opt.inccommand            = "nosplit"

-- Files
opt.swapfile              = false
opt.undofile              = true
opt.undodir               = os.getenv("HOME") .. "/.cache/nvim/undodir"

-- Disable providers
g.loaded_node_provider    = 0
g.loaded_perl_provider    = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider    = 0
