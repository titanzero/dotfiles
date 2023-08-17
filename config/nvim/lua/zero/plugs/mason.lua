return {
  {
    "folke/neodev.nvim",
    lazy = true,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    lazy = true,
    config = true,
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
}
