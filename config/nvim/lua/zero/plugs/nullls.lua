return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      ---@diagnostic disable-next-line: unused-local
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        debug = false,
        sources = {
          formatting.stylua,
          formatting.taplo,
          diagnostics.yamllint,
          formatting.yamlfix,
        },
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "stylua",
        "yamlfix",
        "yamllint"
      },
      automatic_setup = true,
    },
  },
}
