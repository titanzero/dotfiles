local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

--===== Esc clear HLSearch and Notify
map("n", "<Esc>", "", {
  callback = function()
    vim.cmd("noh")
  end,
  desc = "Dismiss hlsearch",
  noremap = true,
  silent = true,
})

--===== <leader>w to quit buffer
map("n", "<leader>w", ":bdelete!<cr>", opts)

--===== Map telescope
map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
map("n", "<leader>fh", ":Telescope help_tags<cr>", opts)

--===== Better window management
map("n", "<c-h>", "<c-w>h", opts)
map("n", "<c-l>", "<c-w>l", opts)
map("n", "<c-j>", "<c-w>j", opts)
map("n", "<c-k>", "<c-w>k", opts)
