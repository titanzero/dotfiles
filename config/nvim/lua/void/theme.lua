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
--	VoidVim theme configuration
--

local _M = {}

_M.setup = function()
  vim.g.catppuccin_flavour = 'mocha'

  require 'catppuccin'.setup {
    term_colors = true,
    compile = {
      enable = true
    },
    styles = {
      comments = {},
    },
    integrations = {
      gitsigns = true,
      telescope = true
    }
  }

  vim.notify = require 'notify'
  vim.notify.setup {
    fps = 60,
    stages = 'fade',
    timeout = 250,
    on_open = function(win) vim.api.nvim_win_set_config(win, { focusable = false }) end,
  }

  vim.cmd [[colorscheme catppuccin]]
end

return _M
