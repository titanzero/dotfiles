return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    main = "ibl",
    opts = {
      scope = {
        enabled = true,
      },
      exclude = {
        filetypes = { "help", "lazy", "dashboard" },
      },
    },
  }
}
