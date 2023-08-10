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
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
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
    keys = {
      { "<leader>w", "bdelete! %d", desc = "Delete the current buffer" }
    }
  },
}
