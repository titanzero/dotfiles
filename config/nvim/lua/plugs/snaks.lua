return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = {
      enabled = false
    },
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
    explorer = {
      enabled = false
    },
    indent = {
      enabled = true
    },
    input = {
      enabled = true
    },
    picker = {
      enabled = true,
      ui_select = true,
    },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = {
      enabled = false
    },
    scope = {
      enabled = false
    },
    scroll = {
      enabled = false
    },
    statuscolumn = {
      enabled = false
    },
    words = {
      enabled = false
    },
    zen = {
      win = {
        width = 150,
        backdrop = {
          transparent = false,
        },
      },
    },
  },
  keys = {
    --[[ Explorere & Top pickers ]]
    { "<leader>e",  function() Snacks.explorer() end,       desc = "File explorer" },
    { "<leader>gg", function() Snacks.lazygit() end,        desc = "LazyGit" },
    { "<leader>z",  function() Snacks.zen() end,            desc = "Zen Mode" },
    { "<leader>t",  function() Snacks.terminal() end,       desc = "Toggle teriminal" },
    --[[ Files ]]
    { "<leader>ff", function() Snacks.picker.files() end,   desc = "Find files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fg", function() Snacks.picker.grep() end,    desc = "Find in files" },
    { "<leader>fr", function() Snacks.picker.recent() end,  desc = "Recent files" },
    --[[ Misc ]]
    { "<leader>fh", function() Snacks.picker.help() end,    desc = "Fuzzy search help" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Mapped keys" },
  },
}
