return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
          { desc = " Config", group = "@property", action = "e ~/.config/nvim/init.lua", key = "e" }
        }
      },
    },
  },
}
