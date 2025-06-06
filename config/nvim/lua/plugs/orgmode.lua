return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  enabled = false,
  ft = { "org" },
  opts = {
    org_agenda_files = "~/Notes/**/*",
    org_default_note_file = "~/Notes/refile.org",
  }
}
