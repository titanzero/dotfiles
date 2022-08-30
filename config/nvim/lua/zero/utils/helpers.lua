local _M = {}

_M.map = function(mode, lhs, rhs, opts, bufnr)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  if bufnr then options['buffer'] = bufnr end
  vim.keymap.set(mode, lhs, rhs, options)
end

return _M
