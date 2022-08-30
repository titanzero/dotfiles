local map = require 'zero.utils.helpers'.map
local capabilities = require 'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require 'lspconfig'
local lsps = {
  lua = require 'zero.plugins.lsp.servers.sumneko',
  csharp = require 'zero.plugins.lsp.servers.omnisharp',
}

local signs = {
  { name = 'DiagnosticSignError', text = '' },
  { name = 'DiagnosticSignWarn', text = '' },
  { name = 'DiagnosticSignHint', text = '' },
  { name = 'DiagnosticSignInfo', text = '' },
}
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  map('n', '<leader>gd', ':lua vim.lsp.buf.declaration()<cr>', {}, bufnr)
  map('n', '<leader>gD', ':Telescope lsp_definitions<cr>', {}, bufnr)
  map('n', '<leader>gi', ':Telescope lsp_implementations<cr>', {}, bufnr)
  map('n', '<leader>gy', ':Telescope lsp_type_definitions<cr>', {}, bufnr)
  map('n', '<leader>gr', ':Telescope lsp_references<cr>', {}, bufnr)
  map('n', '<leader>gn', ':lua vim.lsp.buf.rename()<cr>', {}, bufnr)
  map('n', '<leader>ga', ':lua vim.lsp.buf.code_action()<cr>', {}, bufnr)
  map('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<cr>', {}, bufnr)
  map('n', 'K', ':lua vim.lsp.buf.hover()<cr>', {}, bufnr)

  if client.server_capabilities.documentFormattingProvider then
    map('n', '<leader>gcf', ':lua vim.lsp.buf.format { async = true }<cr>', {}, bufnr)
  end

  require 'lsp-format'.on_attach(client)
end

require 'lsp-format'.setup {}
require 'mason'.setup {
  ui = {
    border = 'rounded'
  }
}
require 'mason-lspconfig'.setup {
  ensure_installed = {
    'sumneko_lua', 'omnisharp'
  }
}
require 'mason-lspconfig'.setup_handlers {
  function(server)
    local config = {
      capabilities = capabilities,
      on_attach = on_attach
    }

    if server == 'sumneko_lua' then
      config.settings = lsps.lua
    end

    if server == 'omnisharp' then
      config = vim.tbl_deep_extend('force', config, lsps.csharp)
    end

    lspconfig[server].setup(config)
  end
}

map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

vim.diagnostic.config {
  signs = {
    active = signs
  },
  virtual_text = false,
  update_in_insert = true,
  underline = true,
  float = {
    focusable = false,
    style = 'minimal',
    source = 'always',
    border = 'rounded'
  }
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded'
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded'
})
