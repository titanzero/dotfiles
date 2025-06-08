---@type LazyPluginSpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    ---@class snacks.dashboard.Config
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })" },
          -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
╔╦╗┬ ┬┌─┐  ╔═╗┌┐┌┌─┐
 ║ ├─┤├┤   ║ ║│││├┤
 ╩ ┴ ┴└─┘  ╚═╝┘└┘└─┘
        ]],
      },
      sections = {
        {
          { section = "header" },
          { section = "keys",   gap = 1, padding = 1 },
          { section = "startup" },
        }
      }
    },
    animate = {
      enabled = true,
    },
    input = {
      enabled = true,
    },
    picker = {
      enabled = true,
    },
    ---@class snacks.indent.Config
    indent = {
      enabled = true,
    },
    ---@class snacks.image.Config
    ---@field resolve? fun(file: string, src: string): string?
    image = {
      enabled = true,
    },
    ---@class snacks.notifier.Config
    ---@field keep? fun(notif: snacks.notifier.Notif): boolean # global keep function
    ---@field filter? fun(notif: snacks.notifier.Notif): boolean # filter our unwanted notifications (return false to hide)
    notifier = {
      enabled = true,
    },
  },
}
