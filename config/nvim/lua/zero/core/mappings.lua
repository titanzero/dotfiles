local map = require 'zero.utils.helpers'.map

map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- navigation
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- exit insert mode
map('i', 'jk', '<esc>')
map('t', 'jk', '<C-\\><C-n>')

-- remove hlsearch
map('n', '<esc>', '<cmd> nohl<cr>')

-- center search
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

map('x', 'K', ':move \'<-2<CR>gv-gv')
map('x', 'J', ':move \'>+1<CR>gv-gv')

-- telescope
map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fb', ':Telescope buffers<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fh', ':Telescope help_tags<cr>')
map('n', '<leader>ft', ':Telescope treesitter<cr>')

-- nvim-tree
map('n', '<leader>t', ':NvimTreeToggle<cr>')
