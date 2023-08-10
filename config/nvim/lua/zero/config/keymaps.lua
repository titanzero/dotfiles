local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

--===== Esc clear HLSearch and Notify
map("n", "<Esc>", "", {
  callback = function()
    vim.cmd("noh")

    if require("zero.utils.loaded")("nvim-notify") then
      require("notify").dismiss({ silent = true, pending = true })
    end
  end,
  desc = "Dismiss HLSearch and Notify",
  noremap = true,
  silent = true,
})
