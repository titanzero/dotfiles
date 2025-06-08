---@type LazyPluginSpec
return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      options = {
        signcolumn = "no", -- disable signcolumn
        number = false, -- disable number column
        relativenumber = false, -- disable relative numbers
        cursorline = false, -- disable cursorline
        cursorcolumn = false, -- disable cursor column
        foldcolumn = "0", -- disable fold column
        list = false, -- disable whitespace characters
      },
    },
    on_open = function()
      require("lualine").hide({
        unhide = false,
        place = {
          "tabline", "winbar", "statusline"
        },
      })
    end,
    on_close = function()
      require("lualine").hide({
        unhide = true,
        place = { "tabline", "winbar", "statusline" }
      })
    end,
  },
}
