local modules = {
  'zero.compiled',
  'zero.core',
}

for _, module in pairs(modules) do
  local mod_ok, err = pcall(require, module)
  if module == 'zero.compiled' and not mod_ok then
    vim.notify('Run :PackerCompile!', vim.log.levels.WARN, {
      title = 'ZeroNvim',
    })
  elseif not mod_ok then
    error(('Error loading %s, %s'):format(module, err))
  end
end