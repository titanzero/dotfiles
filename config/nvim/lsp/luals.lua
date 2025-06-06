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
    },
  },
}

