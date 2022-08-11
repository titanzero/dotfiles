--
--	      (`-.                         _ .-') _        (`-.           _   .-')
--	    _(OO  )_                      ( (  OO) )     _(OO  )_        ( '.( OO )_
--	,--(_/   ,. \ .-'),-----.   ,-.-') \     .'_ ,--(_/   ,. \ ,-.-') ,--.   ,--.)
--	\   \   /(__/( OO'  .-.  '  |  |OO),`'--..._)\   \   /(__/ |  |OO)|   `.'   |
--	 \   \ /   / /   |  | |  |  |  |  \|  |  \  ' \   \ /   /  |  |  \|         |
--	  \   '   /, \_) |  |\|  |  |  |(_/|  |   ' |  \   '   /,  |  |(_/|  |'.'|  |
--	   \     /__)  \ |  | |  | ,|  |_.'|  |   / :   \     /__),|  |_.'|  |   |  |
--	    \   /       `'  '-'  '(_|  |   |  '--'  /    \   /   (_|  |   |  |   |  |
--	     `-'          `-----'   `--'   `-------'      `-'      `--'   `--'   `--'
--
--
--	VoidVim LSP Initialization
--

local _M = {}

_M.setup = function()
  local capabilities = require 'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local lspconfig = require 'lspconfig'
  local map = require 'utils.map'
  local cmd = require 'utils.cmd'
  local lsps = {
    lua = require 'void.lsp.sumneko'
  }
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }
  local on_attach = function (client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    if client.server_capabilities.documentFormattingProvider then

    end
  end

  require 'mason'.setup {
    ui = {
      border = 'rounded'
    }
  }
  require 'mason-lspconfig'.setup {
    ensure_installed = {
      'sumneko_lua'
    }
  }
  require 'mason-lspconfig'.setup_handlers {
    function (server)
      local config = {
        capabilities = capabilities,
        on_attach = on_attach
      }

      if server == 'sumneko_lua' then
        config.settings = lsps.lua
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
end

return _M
