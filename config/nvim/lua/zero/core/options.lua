local opt = vim.opt

-- misc stuff
opt.backspace = { 'eol', 'start', 'indent' }
opt.clipboard:append 'unnamedplus'
opt.encoding = 'utf-8'
opt.syntax = 'enable'
opt.termguicolors = true
opt.title = true
opt.equalalways = true

-- ui
opt.cmdheight = 0
opt.lazyredraw = true
opt.showmode = false
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.list = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.laststatus = 3 -- global status line

-- split sanity
opt.splitright = true
opt.splitbelow = true

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.wildmenu = true
opt.wildignore:append { '*/.git/*' }

-- complete
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.shortmess:append 'cI'

-- performance
opt.redrawtime = 1000
opt.timeoutlen = 1000
opt.updatetime = 100

-- indent
opt.autoindent = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.expandtab = false

-- fold
opt.foldenable = true

-- backup
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath('cache') .. '/undo'
