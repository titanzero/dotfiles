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
        ["core.defaults"] = {
          config = {
            journal_folder = "~/Org/journal"
          }
        }, -- Loads default behaviour
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
              notes = "~/Org/notes",
            },
            default_workspace = "notes"
          },
        },
      }
    },
  },
}
