require("zero.core.options")
local utils = require("zero.utils")

utils.very_lazy(function()
  require("zero.core.autocmd")
  require("zero.core.keymaps")
  require("zero.core.globals")
end)

return {}
