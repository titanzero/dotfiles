---@type LazyPluginSpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  ---@type wk.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    preset = "helix",
    delay = 1000,
  }
}
