-- Autocommands User-defined
vim.api.nvim_create_user_command('PackUpdate', function()
  vim.pack.update()
end, {})

-- Autocommands
vim.api.nvim_create_autocmd("FileType", {
  pattern  = "netrw",
  callback = function()
    vim.bo.bufhidden = "wipe"
    vim.bo.buflisted = false
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end

    local map = function(keys, cmd, desc)
      vim.keymap.set("n", keys, cmd, { buffer = args.buf, silent = true, desc = desc })
    end

    -- gd / gr / gi / ca / ss / sd are handled by fzf-lua in keymaps.lua
    map("K",          vim.lsp.buf.hover,   "Hover docs")
    map("<leader>rn", vim.lsp.buf.rename,  "Rename symbol")
    map("<leader>ih", function()
      vim.lsp.inlay_hint.enable(
        not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }),
        { bufnr = args.buf }
      )
    end, "Toggle inlay hints")
  end,
})
