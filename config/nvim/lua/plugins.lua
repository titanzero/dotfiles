-------------------------------------------------------------------------------
--                    ~~ Nicola Leonardi's VIM Configs ~~                    --
-------------------------------------------------------------------------------

local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim', install_path
  })
  execute 'packadd packer.nvim'
end

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'

	-- Themes
	use 'eddyekofo94/gruvbox-flat.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'onsails/lspkind-nvim'

	-- UI
	use 'kyazdani42/nvim-tree.lua'
	use 'lewis6991/gitsigns.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'akinsho/bufferline.nvim'
	use 'editorconfig/editorconfig-vim'

  -- Markdown preview
  use 'iamcco/markdown-preview.nvim'

	-- Telescope
	use 'nvim-telescope/telescope.nvim'

	-- Compe
	use 'hrsh7th/nvim-compe'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'kabouzeid/nvim-lspinstall'
  use 'nvim-treesitter/nvim-treesitter'
end)
