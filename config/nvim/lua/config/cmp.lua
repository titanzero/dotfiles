---
-- CMP main config
---

local cmp = require 'cmp'

---@diagnostic disable-next-line: redundant-parameter
cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  },
  formatting = {
    format = require 'lspkind'.cmp_format({ with_text = false, maxwidth = 50 })
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<cr>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ['<C-e>'] = cmp.mapping.close()
  },
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  }
})
