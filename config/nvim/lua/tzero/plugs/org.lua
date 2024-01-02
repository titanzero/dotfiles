return {
  {
    "nvim-orgmode/orgmode",
      dependencies = {
      { "nvim-treesitter/nvim-treesitter", lazy = true },
    },
    event = "VeryLazy",
    config = function()
      local orgmode = require("orgmode")

      -- Setup TS fro org-mode
      orgmode.setup_ts_grammar()
      orgmode.setup({
        org_agenda_files = "~/Org/**/*",
        org_default_notes_file = "~/Org/notes.org",
        win_border = "rounded",
        win_split_mode = "tabnew"
      })
    end
  }
}
