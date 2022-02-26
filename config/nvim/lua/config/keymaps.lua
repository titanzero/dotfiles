---
-- Keymaps configs
---

local map = vim.api.nvim_set_keymap
local opts = { noremap = false, silent = true }
local terminal_opts = { silent = true }

--
-- Normal mode
--
-- Better splits
map('n', '<C-s>', ':new<cr>', opts)
map('n', '<C-v>', ':vnew<cr>', opts)
map('n', '<C-q>', ':bd<cr>', opts)

-- File save
map('n', 'ww', ':update<cr>', opts)

-- Windows navigation
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize window
map('n', '<S-j>', ':resize -2<cr>', opts)
map('n', '<S-k>', ':resize +2<cr>', opts)
map('n', '<S-h>', ':vertical resize -2<cr>', opts)
map('n', '<S-l>', ':vertical resize +2<cr>', opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<cr>', opts)
map('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
map('n', '<leader>fb', ':Telescope buffers<cr>', opts)
map('n', '<leader>fh', ':Telescope help_tags<cr>', opts)

-- Nvimtree
map('n', '<leader>t', ':NvimTreeToggle<cr>', opts)

--
-- Insert mode
--
-- File save
map('i', 'ww', '<Esc>:update<cr>gi', opts)

--
-- Terminal mode
--
-- Better exit
map('t', '<Esc>', '<C-\\><C-n>', terminal_opts)
