-- Add conform for autoformat
vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_format = "fallback",
  },
})
