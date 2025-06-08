---@type LazyPluginSpec
return {
  "hrsh7th/nvim-cmp",
  -- enabled = false,
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  lazy = true,
  event = "InsertEnter",
  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end


    ---@type cmp.ConfigSchema
    return {
      window = {
        completion = {
          border = "rounded",
          scrollbar = true,
        },
        documentation = {
          border = "rounded",
          scrollbar = "║",
        },
      },
      completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = "λ",
            luasnip = "⋗",
            buffer = "Ω",
            path = "/",
          }


          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
      mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { "i" }),
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { "i" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- If it's a snippet then jump between fields
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
            -- otherwise if the completion pop is visible then complete
          elseif cmp.visible() then
            cmp.confirm({ select = false })
            -- if the popup is not visible then open the popup
          elseif has_words_before() then
            cmp.complete()
            -- otherwise fallback
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              end
            else
              fallback()
            end
          end,
        }),
        ["<Esc>"] = cmp.mapping(function(fallback)
          luasnip.unlink_current()
          fallback()
        end),
      },
    }
  end,
}
