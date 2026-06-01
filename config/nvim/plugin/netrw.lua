-- ~/.config/nvim/plugin/netrw.lua

-- Appearance
vim.g.netrw_banner    = 0  -- no banner
vim.g.netrw_liststyle = 3  -- tree view

-- Behavior
vim.g.netrw_browse_split = 4  -- open files in the previous window, not inside netrw
vim.g.netrw_altv         = 1  -- vertical split opens to the right
vim.g.netrw_winsize      = 25 -- sidebar width %
vim.g.netrw_keepdir      = 0  -- sync cwd with browsed directory

-- Hide dotfiles by default (toggle with `gh`)
vim.g.netrw_hide      = 1
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

-- Directories first, then files
vim.g.netrw_sort_sequence = [[\/$,*]]

