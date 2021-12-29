---
-- Keymaps configs
---

local map = vim.api.nvim_set_keymap
local opts = { noremap = false, silent = true }

-- Map C-j/k to move line up and down, in normal and visual mode
map('n', '<M-Down>', ':m .+1<cr>', opts)
map('n', '<M-Up>', ':m .-2<cr>', opts)
map('x', '<M-Down>', ':m >+1<cr>gv=gv', opts)
map('x', '<M-Up>', ':m <-2<cr>gv=gv', opts)

-- Better splits
map('n', '<C-s>', ':new<cr>', opts)
map('n', '<C-v>', ':vnew<cr>', opts)
map('n', '<C-j>', '<C-w><C-j>', opts)
map('n', '<C-k>', '<C-w><C-k>', opts)
map('n', '<C-h>', '<C-w><C-h>', opts)
map('n', '<C-l>', '<C-w><C-l>', opts)
map('n', '<C-q>', ':bd<cr>', opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<cr>', opts)
map('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
map('n', '<leader>fb', ':Telescope buffers<cr>', opts)
map('n', '<leader>fh', ':Telescope help_tags<cr>', opts)
map('n', '<C-a>', ':Telescope lsp_code_actions<cr>', opts)
map('n', '<C-d>', ':Telescope treesitter<cr>', opts)

-- LSP
map('n', '<C-i>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
map('i', '<C-i>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
