local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load lazy
require("lazy").setup({
  spec = "zero.core.plugs",
  defaults = {
    lazy = false,
    version = "*", -- try installing the latest stable version for plugins that support semver
  },
  ui = {
    border = "rounded"
  },
  install = {
    colorscheme = { "catppuccin" }
  },
  checker = {
    enabled = false,
    notify = false
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
