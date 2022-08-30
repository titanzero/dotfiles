local disable_builtins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'tutor',
  'rplugin',
  'syntax',
  'synmenu',
  'optwin',
  'compiler',
  'bugreport',
  'ftplugin',
  'fzf',
}

local disable_providers = {
  'node',
  'perl',
  'python3',
  'python',
  'ruby'
}

for _, plugin in pairs(disable_builtins) do
  vim.g['loaded_' .. plugin] = 1
end

for _, provider in pairs(disable_providers) do
  vim.g['loaded_' .. provider .. '_provider'] = 0
end
