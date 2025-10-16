---@type LazyPluginSpec
return {
  "mason-org/mason-lspconfig.nvim",
  event = "BufReadPre",
  opts = {
    ensure_installed = { "lua_ls" },
    servers = {
      copilot = {
        enabled = true,
      },
    },
  },
  dependencies = {
    "neovim/nvim-lspconfig",
    {
      "mason-org/mason.nvim",
      opts = {
        ensure_installed = {
          "lua_ls", "roslyn", "copilot-language-server"
        },
        ui = {
          border = vim.g.__BORDERS,
        },
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      },
    },
    {
      "seblyng/roslyn.nvim",
      ---@module 'roslyn.config'
      ---@type RoslynNvimConfig
      opts = {},
      config = true,
    },
  },
}
