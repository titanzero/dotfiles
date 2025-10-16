return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  opts = {
    org_agenda_files = "~/Nextcloud/Org/**/*",
    org_default_notes_file = "~/Nextcloud/Org/refile.org",
    win_border = vim.g.__BORDERS,
  },
}
