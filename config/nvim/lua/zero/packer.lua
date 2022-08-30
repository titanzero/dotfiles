local packer_installed, packer = pcall(require, 'packer')
local first_install = false

if not packer_installed then
  local pack_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

  vim.notify 'Cloning packer...'
  vim.fn.delete(pack_path, 'rf')
  vim.fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    '--depth',
    '20',
    pack_path,
  })

  vim.api.nvim_command 'packadd packer.nvim'

  packer_installed, packer = pcall(require, 'packer')

  if packer_installed then
    vim.notify 'Packer cloned successfully...'
    first_install = true
  else
    vim.notify('Could not clone packer, error: ' .. packer)
  end
end

packer.init {
  display = {
    open_fn = function()
      return require 'packer.util'.float { border = 'rounded' }
    end,
    prompt_border = 'rounded',
  },
  profile = {
    enable = true,
    thresold = 1
  },
  compile_path = vim.fn.stdpath 'config' .. '/lua/zero/compiled.lua',
  auto_clean = true,
  compile_on_sync = true,
  auto_reload_compiled = true
}

return {
  packer = packer,
  first_install = first_install
}
