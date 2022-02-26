---
-- LSP Server configs
---

local opts = { noremap = false, silent = true }
local map = vim.api.nvim_buf_set_keymap

return {
  lua = require 'lsps.sumneko',
  ccls = require 'lsps.ccls',
  capabilities = require 'cmp_nvim_lsp'.update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = function (bufnr)
    map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    map(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    map(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    map(bufnr, 'n', 'gk', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  end
}
