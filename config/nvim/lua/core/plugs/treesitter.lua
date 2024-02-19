return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
      ensure_installed = {
        "lua",
        "vimdoc",
        "regex",
        "markdown",
        "markdown_inline"
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      context_commentstring = { enable = true },
    },
  },
}
