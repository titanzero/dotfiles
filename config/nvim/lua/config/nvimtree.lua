--
-- NvimTree main config
--

vim.cmd [[
  let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1
  \}
]]

require 'nvim-tree'.setup({
  diagnostics = {
    enable = true
  },
  view = {
    width = 50
  }
})
