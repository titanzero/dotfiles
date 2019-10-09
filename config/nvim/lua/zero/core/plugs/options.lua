require("zero.core.options")
local utils = require("zero.utils")

utils.very_lazy(function()
  -- Call autocmd registration and keymaps
  require("zero.core.keymaps")
end)

return {}
