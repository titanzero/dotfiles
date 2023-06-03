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
      winbar = {
        enabled = true,
        name_formatter = function(term)
          return string.format("%d:%s", term.id, term:_display_name())
        end,
      },
    },
  },
}
