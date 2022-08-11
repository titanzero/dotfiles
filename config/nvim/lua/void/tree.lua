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
--	VoidVim Nvimtree configuration
--

local _M = {}

_M.setup = function()
  local map = require 'utils.map'
  local cmd = require 'utils.cmd'

  require 'nvim-tree'.setup {
    disable_netrw = true,
    hijack_cursor = true,
    view = {
      width = 45,
      hide_root_folder = true,
    }
  }

  map('n', '<leader>t', cmd 'NvimTreeToggle', opts)
end

return _M
