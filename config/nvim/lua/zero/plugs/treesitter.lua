return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
      ensure_installed = {
        "c",
        "regex",
        "bash",
        "markdown",
        "markdown_inline",
        "lua",
        "c_sharp",
        "norg",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      context_commentstring = { enable = true },
      rainbow = {
        enable = false,
        query = "rainbow-parens",
        disable = { "jsx", "html" },
      },
    },
  },
}
