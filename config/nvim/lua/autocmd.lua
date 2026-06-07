-- Autocommands User-defined
vim.api.nvim_create_user_command("PackUpdate", function()
  vim.pack.update()
end, {})
