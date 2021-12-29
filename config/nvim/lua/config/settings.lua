---
-- VIM general settings
---

vim.o.termguicolors = true

-- Decrease update times
vim.o.updatetime = 100
vim.o.timeoutlen = 500

-- Amount of lines to keep above/below cursor
vim.o.scrolloff = 8
vim.o.mouse = 'a'

-- Better UI
vim.o.number = true
vim.o.numberwidth = 6
vim.o.relativenumber = true
vim.o.signcolumn = 'yes:2'
vim.o.cursorline = true

-- Editing experience
vim.o.expandtab = true
vim.o.wrap = true
vim.o.clipboard = 'unnamedplus'

-- Disable tmp files
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.swapfile = false

-- Split sanity
vim.o.splitright = true
vim.o.splitbelow = true
