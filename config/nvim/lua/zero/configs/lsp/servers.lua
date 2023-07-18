return {
  omnisharp = {
    enable_import_completion = true,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
  },
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
