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
--	VoidVim Telescope config
--

local _M = {}

_M.setup = function()
  local telescope = require 'telescope'
  local actions = require 'telescope.actions'
  local map = require 'utils.map'
  local cmd = require 'utils.cmd'

  telescope.setup {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<esc>"] = actions.close,
        },
        n = {
          ["q"] = actions.close,
        },
      },
    },
    extensions = {
      ['ui-select'] = {
        require 'telescope.themes'.get_dropdown {}
      }
    }
  }

  telescope.load_extension 'ui-select'

  map('n', '<leader>ff', cmd 'Telescope find_files')
  map('n', '<leader>fb', cmd 'Telescope buffers')
  map('n', '<leader>fg', cmd 'Telescope live_grep')
  map('n', '<leader>fh', cmd 'Telescope help_tags')
  map('n', '<leader>ft', cmd 'Telescope treesitter')

end

return _M
