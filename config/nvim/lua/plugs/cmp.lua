---@type LazyPluginSpec
return {
  "saghen/blink.cmp",
  event = "BufReadPre",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "xzbdmw/colorful-menu.nvim",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      opts = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          "lazy.nvim",
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    {
      "fang2hou/blink-copilot",
      config = true,
    }
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
    },
    snippets = {
      preset = "luasnip",
    },
    signature = {
      enabled = true,
      window = {
        border = vim.g.__BORDERS,
        treesitter_highlighting = true,
        show_documentation = true,
      },
    },
    appearance = {
      highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lazydev", "lsp", "copilot", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 50,
          async = true,
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = vim.g.__BORDERS
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      menu = {
        border = vim.g.__BORDERS,
        draw = {
          -- We don't need label_description now because label and label_description are already
          -- combined together in label by colorful-menu.nvim.
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          },
        }
      },
      ghost_text = {
        enabled = true,
      },
    },
  },
}
