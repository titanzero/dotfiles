---
-- LSP main config
---

local lsps = require 'lsps'
local opts = {
  capabilities = lsps.capabilities,
  on_attach = lsps.on_attach
}
local servers = {
  'ccls',
  'sumneko_lua',
  'yamlls'
}
local lsp_installer = require 'nvim-lsp-installer';

for _, name in pairs(servers) do
  local server_found, server = lsp_installer.get_server(name)

  if server_found and not server:is_installed() then
    print('Installing ' .. name)
    server:install()
  end
end

lsp_installer.on_server_ready(function(server)

  if server.name == 'sumneko_lua' then
    opts.settings = lsps.lua
  end

  if server.name == 'ccls' then
    opts.settings = lsps.ccls
  end

  server:setup(opts)
end)
