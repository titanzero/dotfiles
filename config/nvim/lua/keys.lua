local map = vim.keymap.set

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

--[[
  Since usually I use a split keyboard, I should remap hjkl to jkl;
    But why? Just lazyness, index is on j, so it's more natural to
    use j as left, instead of h, as I should move my hand to the left
    by one key, and my arrow keys are just under jkl;

  I think this is the best explanation of lazyness...
]]
map("n", "<C-j>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-k>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-l>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-;>", "<C-w>l", { desc = "Go to Right Window", remap = true })

--[[ Map esc to clear search ]]
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")

  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })
