return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      { "catppuccin" }
    },
    event = { "BufReadPost" },
    lazy = true,
    opts = {
--      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
        separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
        indicator = {
          style = "icon",
        },
        diagnostics_indicator = function(_, _, diagnostics_dict, _)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or "")
            s = s .. n .. sym
          end
          return s
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "EXPLORER",
            text_align = "center",
          },
        },
      },
    },
  },
}
