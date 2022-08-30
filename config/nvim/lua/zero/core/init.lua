local core_modules = {
  'zero.core.disabled',
  'zero.core.options',
  'zero.core.plugins',
  'zero.core.mappings',
  'zero.core.autocmd',
}

for _, module in pairs(core_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error(('Error loading %s, %s'):format(module, err))
  end
end
