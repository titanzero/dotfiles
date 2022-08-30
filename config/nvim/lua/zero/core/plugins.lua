local packer_lib = require 'zero.packer'
local packer = packer_lib.packer

return packer.startup(function(use)
  -- base plugins
  use {
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
  }
  use { 'nvim-lua/plenary.nvim', module = 'plenary' }

  --{{{ UI Customization
  use {
    'kyazdani42/nvim-web-devicons',
    module = 'nvim-web-devicons',
    config = function()
      require 'nvim-web-devicons'.setup { default = true }
    end
  }

  use {
    'onsails/lspkind.nvim',
    module = 'lspkind',
  }

  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function() require 'zero.plugins.theme' end,
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    module = 'telescope',
    requires = {
      { 'nvim-telescope/telescope-ui-select.nvim' }
    },
    config = function()
      require 'zero.plugins.telescope'
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeClose' },
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'zero.plugins.nvim-tree'
    end,
  }

  --}}}

  --{{{ Editing
  use {
    'gpanders/editorconfig.nvim',
    event = 'BufReadPre'
  }

  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    event = 'BufReadPre',
    config = function()
      require 'zero.plugins.gitsigns'
    end,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    config = function()
      require 'indent_blankline'.setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    module = 'nvim-treesitter',
    requires = {
      { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' }
    },
    config = function()
      require 'zero.plugins.treesitter'
    end,
    run = function()
      require 'nvim-treesitter.install'.update { with_sync = true }
    end,

  }
  --}}}

  --{{{ IDEsque
  use {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    module = 'nvim-cmp',
    opt = true,
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-calc',
      'f3fora/cmp-spell',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      {
        'L3MON4D3/LuaSnip',
        wants = 'friendly-snippets',
        module = 'luasnip',
        config = function()
          require 'zero.plugins.luasnip'
        end,
      },
      'rafamadriz/friendly-snippets'
    },
    config = function()
      require 'zero.plugins.cmp'
    end,
  }

  use {
    'williamboman/mason.nvim',
    opt = true,
    event = 'BufReadPre',
    wants = {
      'nvim-lspconfig', 'lsp-format.nvim', 'mason-lspconfig.nvim'
    },
    requires = {
      'williamboman/mason-lspconfig.nvim',
      {
        'neovim/nvim-lspconfig',
        wants = { 'cmp-nvim-lsp' }
      },
      'lukas-reineke/lsp-format.nvim'
    },
    config = function() require 'zero.plugins.lsp' end,
 }


  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
      require 'nvim-autopairs'.setup {}
      require 'cmp'.event:on('confirm_done',
        require 'nvim-autopairs.completion.cmp'.on_confirm_done { map_char = { tex = '' } })
    end,
  }
  --}}}

  if packer_lib.first_install then
    packer.sync()
  end
end)
