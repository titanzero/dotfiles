local map = vim.keymap.set

--[[
  Since usually I use a split keyboard, I should remap hjkl to jkl;
    But why? Just lazyness, index is on j, so it's more natural to
    use j as left, instead of h, as I should move my hand to the left
    by one key

  I think this is the best explanation of lazyness...
]]
-- map({ "n", "v", "x", "s" }, ";", "l", { noremap = true })
-- map({ "n", "v", "x", "s" }, "l", "k", { noremap = true })
-- map({ "n", "v", "x", "s" }, "k", "j", { noremap = true })
-- map({ "n", "v", "x", "s" }, "j", "h", { noremap = true })

--[[ better up/down ]]
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

--[[ Move to window using the <ctrl> hjkl keys ]]
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

--[[ Resize window using <ctrl> arrow keys ]]
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

--[[ Move Lines ]]
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

--[[ Basic commands and schedules ]]
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")

  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

--[[ Gitsigns keymaps ]]
map("n", "[h", "<cmd>Gitsigns nav_hunk prev<cr>", { desc = "Navigate to prev hunk" })
map("n", "]h", "<cmd>Gitsigns nav_hunk next<cr>", { desc = "Navigate to next hunk" })
map("n", "<leader>sh", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk under cursor" })
map("n", "<leader>sb", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage current buffer" })
map("n", "<leader>lg", function() Snacks.lazygit() end, { desc = "Open lazygit" })

--[[ Snacks keymaps ]]
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Fuzzy search files" })
map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Fuzzy search in files (cwd)" })
map("n", "<leader>fG", function() Snacks.picker.grep_buffers() end, { desc = "Fuzzy search in opened buffers" })
map("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Fuzzy search help" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Show open buffers" })
map("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "Show mapped keys" })
map("n", "<leader>e", function() Snacks.picker.explorer() end, { desc = "Open explorer" })

--[[ Buffer ]]
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

--[[ Neorg ]]
map("n", "<leader>toc", "<cmd>Neorg toc<cr>", { desc = "Create neorg toc" })

--[[ Zenmode ]]
map("n", "<leader>zz", "<cmd>ZenMode<cr>", { desc = "Toggle ZenMode" })
