vim.lsp.config('lua_ls', {
  flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 100,
    exit_timeout = false,
  },
  settings = {
    Lua = {
      telemetry = {
        enable = false,
      },
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.api.nvim_get_runtime_file("", true),
        },
      },
      diagnostics = {
        globals = {
          "vim",
        },
      },
    }
  },
})
