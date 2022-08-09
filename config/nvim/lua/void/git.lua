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
--	VoidVim Git config
--

local _M = {}

_M.setup = function()
  local map = require 'utils.map'

  require 'gitsigns'.setup {
    watch_gitdir = {
      interval = 100
    },
    preview_config = {
      border = 'rounded'
    },
    numhl = true,
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 100,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      map('n', ']h', function()
        if vim.wo.diff then return ']h' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      map('n', '[h', function()
        if vim.wo.diff then return '[h' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      map({ 'n', 'v' }, '<leader>hs', gs.stage_hunk)
      map({ 'n', 'v' }, '<leader>hr', gs.reset_hunk)
      map('n', '<leader>hu', gs.undo_stage_hunk)

      map('n', '<leader>hS', gs.stage_buffer)
      map('n', '<leader>hR', gs.reset_buffer)
      map('n', '<leader>hU', gs.reset_buffer_index)

      map('n', '<leader>hd', gs.diffthis)
      map('n', '<leader>hD', function() gs.diffthis('~') end)

      map('n', '<leader>hp', gs.preview_hunk)
    end
  }
end

return _M
