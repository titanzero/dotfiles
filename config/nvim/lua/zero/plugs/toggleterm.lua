return {
  {
    "akinsho/toggleterm.nvim",
    event = { "VeryLazy" },
    opts = {
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = "rounded",
      },
      close_on_exit = true,
    },
  },
}
