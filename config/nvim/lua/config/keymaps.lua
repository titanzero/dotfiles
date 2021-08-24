-------------------------------------------------------------------------------
--                    ~~ Nicola Leonardi's VIM Configs ~~                    --
-------------------------------------------------------------------------------

------------------------------ NvimTree  Keymaps ------------------------------
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<M-Left>', ':BufferLineCyclePrev<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<M-Right>', ':BufferLineCycleNext<CR>', {noremap = false, silent = false})

-------------------------------- Compe Keymaps --------------------------------
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm(\'<CR>\')', {noremap = true, silent = true, expr = true})

------------------------------ Telescope Keymaps ------------------------------
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = false, expr = false})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = false, expr = false})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true, silent = false, expr = false})
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', {noremap = true, silent = false, expr = false})
