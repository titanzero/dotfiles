return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    opts = {
      compile = true,
      dimInactive = true
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)

      vim.cmd.colorscheme("kanagawa")
    end,
  }
}
