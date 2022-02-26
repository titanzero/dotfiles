---
-- LSP main config
---

local lsps = require 'lsps'
local opts = {
  capabilities = lsps.capabilities,
  on_attach = lsps.on_attach
}

require 'nvim-lsp-installer'.on_server_ready(function(server)

  if server.name == 'sumneko_lua' then
    opts.settings = lsps.lua
  end

  if server.name == 'ccls' then
    opts.settings = lsps.ccls
  end

  server:setup(opts)
end)
