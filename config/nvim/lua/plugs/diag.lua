return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000, -- needs to be loaded in first
  opts = {
    options = {
      show_source = {
        enabled = true,
      },
      throttle = 0,
      use_icons_from_diagnostic = true,
      enable_on_insert = true,
    },
  },
}
