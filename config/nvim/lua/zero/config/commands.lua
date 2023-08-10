-- Disable satstuscolumn for neo-tree and help tags
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    if vim.bo.filetype == "neo-tree" or vim.bo.filetype == "help" then
      vim.opt_local.statuscolumn = ""
    end
  end,
})
