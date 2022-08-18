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
--	Sane defaults for neovim
--

local defaults = {
  termguicolors = true,
  completeopt = { 'menu', 'menuone', 'noselect' },
  updatetime = 100,
  timeoutlen = 1000,
  --showmode = false,
  backup = false,
  undofile = true,
  scrolloff = 8,
  sidescrolloff = 8,
  tabstop = 2,
  shiftwidth = 2,
  clipboard = 'unnamedplus',
  fileencoding = 'utf-8',

  -- Number & Line
  number = true,
  numberwidth = 4,
  signcolumn = 'yes',
  relativenumber = true,
  cursorline = true,

  -- Search
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  gdefault = true,

  -- Split
  splitbelow = true,
  splitright = true,
}

vim.opt.shortmess:append 'c'

for name, value in pairs(defaults) do
  vim.opt[name] = value
end

-- disable builtin plugins
local disabled_plugins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'matchit',
  'matchparen',
  'netrw',
  'netrwFileHandlers',
  'netrwPlugin',
  'netrwSettings',
  'rrhelper',
  'spec',
  'spellfile_plugin',
  'tar',
  'tarPlugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin'
}

for _, plugin in ipairs(disabled_plugins) do
  vim.g['loaded_' .. plugin] = 1
end
