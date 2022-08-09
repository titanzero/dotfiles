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
--	VoidVim initialization file
--

local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOT_COMMAND = fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
	print 'Installing packer...'
	execute 'packadd packer.nvim'
	print 'Done!'
end

local packer = require 'packer'

packer.init {
	display = {
		open_fn = function()
			return require 'packer.util'.float { border = 'rounded' }
		end,
	},
}

local startup = packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'rcarriga/nvim-notify'

	-- Editing experience
	use 'gpanders/editorconfig.nvim'
  use { 'kylechui/nvim-surround', config = function() require 'nvim-surround'.setup() end }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'famiu/bufdelete.nvim'
  use 'windwp/nvim-autopairs'

  -- Theme
  use 'kyazdani42/nvim-web-devicons'
  use { 'catppuccin/nvim', as = 'catppuccin', config = function() require 'void.theme'.setup() end }

  -- Git
  use { 'lewis6991/gitsigns.nvim', config = function() require 'void.git'.setup() end }

  -- NvimTree
  use { 'kyazdani42/nvim-tree.lua', config = function() require 'void.tree'.setup() end }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require 'void.treesitter'.setup() end,
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-ui-select.nvim' }
    },
    config = function() require 'void.telescope'.setup() end
  }

	if PACKER_BOOT_COMMAND then
		packer.sync()
	end
end)

-- Load configurations
require 'defaults'
require 'void.autocmd'
require 'void.keymaps'.init()

return startup
