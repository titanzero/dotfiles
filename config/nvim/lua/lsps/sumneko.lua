---
-- Sumneko Lua Config
---

return {
  Lua = {
    completion = { keywordSnipper = 'Disable' },
    diagnostics = {
      enable = true,
      globals = { 'use', 'vim' }
    },
    runtime = {
      version = 'LuaJIT',
      path = { '?.lua', '?/init.lua', 'lua/?.lua', 'config/?.lua' }
    },
    telemetry = {
      enable = false
    },
    workspace = {
      checkThirdParty = false,
      library = vim.api.nvim_get_runtime_file('', true),
    }
  }
}
