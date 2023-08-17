return {
  omnisharp = {
    enable_editorconfig_support = true,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
    cmd = {
      "/Users/nicola/.local/share/nvim/mason/packages/omnisharp/omnisharp"
    }
  },
  yamlls = {},
  marksman = {},
  taplo = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        diagnostics = {
          globals = {
            "vim",
          },
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
