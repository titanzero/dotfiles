return {
  {
    "nvim-neorg/neorg",
    event = { "BufReadPost *.norg", "InsertEnter *.norg" },
    cmd = "Neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
      { "nvim-lua/plenary.nvim" }
    },
    opts = {
      load = {
        ["core.journal"] = {
          config = {
            journal_folder = "~/Neorg/journal",
          },
        }, -- Loads default behaviour
        ["core.qol.toc"] = {
          config = {
            close_after_use = true,
            sync_cursorline = true,
          },
        },
        ["core.export"] = {},
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp"
          }
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Neorg/notes",
            },
            default_workspace = "notes"
          },
        },
      }
    },
  },
}
