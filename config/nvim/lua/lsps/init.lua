---
-- LSP Server configs
---

return {
  lua = require 'lsps.sumneko',
  capabilities = require 'cmp_nvim_lsp'.update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )
}
