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
    },
  },
  {
    "gpanders/editorconfig.nvim",
    event = "BufReadPre",
    lazy = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    lazy = true,
    opts = {
      scope = {
        enabled = true,
      },
      exclude = {
        filetypes = { "help", "lazy" },
      },
    },
  },
}
