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

local map = require 'utils.map'
local cmd = require 'utils.cmd'
local KeyMaps = {}

--- Register defaults keymaps
KeyMaps.init = function()
  map('', '<Space>', '<Nop>')
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- Escape
  map('i', 'jk', '<esc>')
  map('t', 'jk', '<C-\\><C-n>')

  -- Move selected line / block in visual mode
  map("x", "J", ":move '>+1<CR>gv-gv")
  map("x", "K", ":move '<-2<CR>gv-gv")

  -- Search
  map('n', 'n', 'nzz')
  map('n', 'N', 'Nzz')

  -- Indent
  ---@diagnostic disable-next-line: redundant-parameter
  cmd('v', '<', '<gv')
  ---@diagnostic disable-next-line: redundant-parameter
  cmd('v', '>', '>gv')

  -- Buffer switch
  map('n', '<S-h>', ':bp<cr>')
  map('n', '<S-l>', ':bn<cr>')

  -- Hard Mode
  map({ 'n', 'i' }, '<Up>', '<Nop>')
  map({ 'n', 'i' }, '<Down>', '<Nop>')
  map({ 'n', 'i' }, '<Left>', '<Nop>')
  map({ 'n', 'i' }, '<Right>', '<Nop>')
end

--- Register lsps specific keymaps
KeyMaps.init_lsp = function(bufnr) end

return KeyMaps
