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
--	VoidVim Autocmds
--

local grp = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

-- Autoreload config
local _configs = grp('_configs', { clear = true })
cmd('BufWritePost', {
  group = _configs,
  pattern = 'init.lua',
  command = 'source <afile>'
})

-- LSP Client
local _M = {}

_M.register_highlights = function()
  local _lsps = grp('_lsps', { clear = false })
  cmd({ 'CursorHold' }, {
    pattern = '<buffer>',
    callback = function()
      vim.lsp.buf.document_highlight()
    end,
    group = _lsps
  })

  cmd({ 'CursorMoved' }, {
    pattern = '<buffer>',
    callback = function()
      vim.lsp.buf.clear_references()
    end,
    group = _lsps
  })
end

return _M
