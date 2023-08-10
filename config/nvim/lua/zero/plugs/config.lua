require("zero.utils.lazyload")(function()
  require("zero.config.keymaps")
  require("zero.config.commands")

  _G.toggle_lazygit = function()
    local terminal = require("toggleterm.terminal").Terminal

    terminal:new({ cmd = "lazygit", hidden = true }):toggle()
  end
end)

-- Placeholder for LazyNvim
return {}
