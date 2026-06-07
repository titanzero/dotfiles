---@brief
--- Configuration for NeoVim Lua LSP.
--- It handles correctly both nvim intenral APIs and plugins installed.
---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      diagnostics = {
        globals = {
          "vim",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = vim.tbl_filter(function(d)
          return not d:match(vim.fn.stdpath("config") .. "/?a?f?t?e?r?")
        end, vim.api.nvim_get_runtime_file("", true)),
        -- libraty = {
        --   vim.env.VIMRUNTIME,
        --   vim.fn.stdpath("config"),
        --   vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
        -- },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
