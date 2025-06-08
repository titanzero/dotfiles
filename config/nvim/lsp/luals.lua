---@type vim.lsp.ClientConfig
return {
  cmd = { "lua-language-server" },
  root_markers = { "stylua.toml", ".luarc.json" },
  filetypes = { "lua" },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 150,
    exit_timeout = false,
  },
  settings = {
    Lua = {
      telemetry = {
        enable = false,
      },
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua"
        },
      },
      diagnostics = {
        globals = {
          "vim",
        },
      },
      workspace = {
        checkthirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}

