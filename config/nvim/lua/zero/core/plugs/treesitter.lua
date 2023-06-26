return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "regex",
        "bash",
        "json",
        "toml",
        "lua",
        "markdown",
        "markdown_inline",
        "c_sharp",
        "zig",
        "rust",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { "yaml", "html" },
      },
      context_commentstring = { enable = true },
      --rainbow = {
      --  enable = false,
      --  query = "rainbow-parens",
      --  disable = { "jsx", "html" },
      --},
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
