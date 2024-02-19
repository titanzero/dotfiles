local opts = { noremap = true, silent = true }
local map = vim.keymap.set
--===== ESC clear hlsearch and Notify
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
map("n", "<leader>ff", ":FzfLua files<cr>", opts)
map("n", "<leader>fg", ":FzfLua live_grep_native<cr>", opts)
map("n", "<leader>bg", ":FzfLua lgrep_curbuf<cr>", opts)
map("n", "<leader>fb", ":FzfLua buffers<cr>", opts)
map("n", "<leader>fh", ":FzfLua help_tags<cr>", opts)
map("n", "z=", ":FzfLua spell_suggest<cr>", opts)

--===== Better window management
map("n", "<c-h>", "<c-w>h", opts)
map("n", "<c-l>", "<c-w>l", opts)
map("n", "<c-j>", "<c-w>j", opts)
map("n", "<c-k>", "<c-w>k", opts)

map("i", "<F2>", "<c-\\><c-o>:w<cr>", opts)
