vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = true,
  float = {
    border = vim.opt.winborder,
    source = "if_many",
  },
  virtual_text = {
    spacing = 2,
    prefix = "●",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.INFO] = "I",
      [vim.diagnostic.severity.HINT] = "H",
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end

    local map = function(keys, cmd, desc)
      vim.keymap.set("n", keys, cmd, { buffer = args.buf, silent = true, desc = desc })
    end

    -- gd / gr / gi / ca / ss / sd are handled by fzf-lua in keymaps.lua
    map("K", vim.lsp.buf.hover, "Hover docs")
    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
    end, "Toggle inlay hints")
  end,
})

vim.lsp.enable({
  "lua_ls",
})
