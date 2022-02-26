local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('data') .. '/packer_compiled.lua'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  execute 'packadd packer.nvim'
end

local packer = require 'packer'.startup({
  function()
    -- Packer management and async
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    -- UI
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use 'catppuccin/nvim'
    use 'onsails/lspkind-nvim'
    use 'lukas-reineke/indent-blankline.nvim'

    -- Editor
    use 'nvim-telescope/telescope.nvim'
    use 'editorconfig/editorconfig-vim'
    use 'windwp/nvim-autopairs'
    use 'norcalli/nvim-colorizer.lua'
    use 'lewis6991/gitsigns.nvim'
    use 'numToStr/Comment.nvim'
    use 'kyazdani42/nvim-tree.lua'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- TreeSitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'romgrk/nvim-treesitter-context'

    -- Complete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
  end,
  config = {
    compile_path = compile_path
  }
})

require 'config.settings'
require 'config.ui'
require 'config.lsp'
require 'config.cmp'
require 'config.treesitter'
require 'config.telescope'
require 'config.nvimtree'
require 'config.gitsigns'
require 'config.comment'
require 'config.lualine'
require 'config.autocmd'
require 'config.keymaps'

return packer
