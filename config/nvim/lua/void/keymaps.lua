--
--	      (`-.                         _ .-') _        (`-.           _   .-')
--	    _(OO  )_                      ( (  OO) )     _(OO  )_        ( '.( OO )_
--	,--(_/   ,. \ .-'),-----.   ,-.-') \     .'_ ,--(_/   ,. \ ,-.-') ,--.   ,--.)
--	\   \   /(__/( OO'  .-.  '  |  |OO),`'--..._)\   \   /(__/ |  |OO)|   `.'   |
--	 \   \ /   / /   |  | |  |  |  |  \|  |  \  ' \   \ /   /  |  |  \|         |
--	  \   '   /, \_) |  |\|  |  |  |(_/|  |   ' |  \   '   /,  |  |(_/|  |'.'|  |
--	   \     /__)  \ |  | |  | ,|  |_.'|  |   / :   \     /__),|  |_.'|  |   |  |
--	    \   /       `'  '-'  '(_|  |   |  '--'  /    \   /   (_|  |   |  |   |  |
--	     `-'          `-----'   `--'   `-------'      `-'      `--'   `--'   `--'
--
--
--	VoidVim Keymaps Config
--

local opts = { noremap = true, silent = true }
local map = require 'utils.map'
local cmd = require 'utils.cmd'
local KeyMaps = {}

--- Register defaults keymaps
KeyMaps.init = function()
  map('', '<Space>', '<Nop>', opts)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- NORMAL
  -- File save
  map('n', 'ww', ':update<cr>', opts)

  map('n', '<leader>t', cmd 'NvimTreeToggle', opts)

  -- Hard Mode
  map({ 'n', 'i' }, '<Up>', '<Nop>', opts)
  map({ 'n', 'i' }, '<Down>', '<Nop>', opts)
  map({ 'n', 'i' }, '<Left>', '<Nop>', opts)
  map({ 'n', 'i' }, '<Right>', '<Nop>', opts)

  -- Buffer mgm
  map('n', '<C-q>', cmd 'Bdelete', opts)

  -- INSERT --
  -- File save
  map('i', 'ww', '<Esc>:update<cr>gi', opts)
end

--- Register lsps specific keymaps
KeyMaps.init_lsp = function(bufnr) end

return KeyMaps
