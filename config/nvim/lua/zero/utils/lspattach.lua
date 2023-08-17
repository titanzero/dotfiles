return function(handle)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      handle(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
    end,
  })
end
