return {
  Lua = {
    diagnostics = {
      globals = { 'vim' }
    },
    runtime = {
      version = 'LuaJIT',
      path = { '?.lua', '?/init.lua', 'lua/?.lua', 'config/?.lua' }
    },
    workspace = {
      checkThirdParty = false,
      library = vim.api.nvim_get_runtime_file('', true),
    }
  }
}
