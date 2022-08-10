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
  local lsps = {
    lua = require 'void.lsp.sumneko'
  }

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

  local on_attach = function (client, bufnr)

  end


  for _, server in pairs(lspconfig.available_servers()) do
    local config = {
      capabilities = capabilities,
      on_attach = on_attach
    }

    if server == 'sumneko_lua' then
      config.settings = lsps.lua
    end
    vim.notify(server)
    server:setup(config)
  end
end

return _M
