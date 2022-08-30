local grp = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

-- treesitter
local _treesitter = grp('_treesitter', { clear = true })
cmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
  group = _treesitter,
  callback = function()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt.foldlevel = 90
  end
})
