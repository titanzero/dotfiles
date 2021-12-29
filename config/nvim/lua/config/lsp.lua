---
-- LSP main config
---

local lsps = require 'lsps'
local opts = {
  capabilities = lsps.capabilities
}

require 'nvim-lsp-installer'.on_server_ready(function(server)

  if server.name == 'sumneko_lua' then
    opts.settings = lsps.lua
  end

  server:setup(opts)
end)
