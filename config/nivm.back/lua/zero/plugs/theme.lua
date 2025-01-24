return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    italic_comments = true,
  },
  config = function(_, opts)
    require("cyberdream").setup(opts)
    vim.cmd("colorscheme cyberdream")
  end,
}
