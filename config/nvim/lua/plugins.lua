-------------------------------------------------------------------------------
--                    ~~ Nicola Leonardi's VIM Configs ~~                    --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--                              Plugins Install                              --
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

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- UI Plugins
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'akinsho/bufferline.nvim'
  use 'Pocco81/Catppuccino.nvim'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- LSP
  use {
    'sumneko/lua-language-server',
    run = {
      'cd 3rd/luamake && ./compile/install.sh && cd ../.. && 3rd/luamake/luamake rebuild'
    }
  }
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/nvim-compe'
end)
