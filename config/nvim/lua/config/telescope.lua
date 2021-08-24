-------------------------------------------------------------------------------
--                    ~~ Nicola Leonardi's VIM Configs ~~                    --
-------------------------------------------------------------------------------
local actions = require('telescope.actions')

require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				['<esc>'] = actions.close
			}
		}
	}
}
