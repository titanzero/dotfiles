return {
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        inlayHints = true,
      }
    }
  },
  zls = {},
  csharp_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        diagnostics = {
          globals = {
            'vim'
          }
        },
        format = {
          enable = false,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
            continuation_indent_size = "2",
          },
        },
      },
    },
  },
}
