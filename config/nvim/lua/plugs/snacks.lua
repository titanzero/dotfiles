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
    ---@field enabled? boolean
    ---@field sections snacks.dashboard.Section
    ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
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
      },
      sections = {
        {
          section = "terminal",
          cmd = "chafa ~/.dotfiles/config/nvim/rc/the_one.png --format symbols --symbols vhalf -s 40x40",
          height = 20,
        },
        {
          pane = 2,
          { section = "keys", gap = 1, padding = 1 },
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
    ---@field enabled? boolean
    indent = {
      enabled = true,
    },
    ---@class snacks.image.Config
    ---@field enabled? boolean enable image viewer
    ---@field wo? vim.wo|{} options for windows showing the image
    ---@field bo? vim.bo|{} options for the image buffer
    ---@field formats? string[]
    --- Resolves a reference to an image with src in a file (currently markdown only).
    --- Return the absolute path or url to the image.
    --- When `nil`, the path is resolved relative to the file.
    ---@field resolve? fun(file: string, src: string): string?
    ---@field convert? snacks.image.convert.Config
    image = {
      enabled = true,
    },
    ---@class snacks.notifier.Config
    ---@field enabled? boolean
    ---@field keep? fun(notif: snacks.notifier.Notif): boolean # global keep function
    ---@field filter? fun(notif: snacks.notifier.Notif): boolean # filter our unwanted notifications (return false to hide)
    notifier = {
      enabled = true,
    },
  },
}
