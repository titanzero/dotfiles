return {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      color_icons = true,
      default = true,
    }
  },
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
  {
    "gpanders/editorconfig.nvim",
    event = "BufReadPre",
    lazy = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    lazy = true,
    opts = {
      show_current_context = true,
      show_current_context_start = true,
    }
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    opts = {
      fps = 60,
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    init = function()
      if not require("zero.utils.loaded")("noice.nvim") then
        require("zero.utils.lazyload")(function()
          vim.notify = require("notify")
        end)
      end
    end,
  },
}
