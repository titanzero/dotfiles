_G.toggle_lazygit = function()
  local terminal = require("toggleterm.terminal").Terminal

  terminal:new({ cmd = "lazygit", hidden = true }):toggle()
end
