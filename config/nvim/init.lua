--[[
╔╦╗┬ ┬┬┌─┐  ┬┌─┐  ┬┌┬┐ ┌┬┐┬ ┬┬┌─┐ ┬┌─┐  ┬ ┬┬ ┬┌─┐┬─┐┌─┐  ╦  ┌┐ ┌─┐┬  ┌─┐┌┐┌┌─┐
 ║ ├─┤│└─┐  │└─┐  │ │   │ ├─┤│└─┐ │└─┐  │││├─┤├┤ ├┬┘├┤   ║  ├┴┐├┤ │  │ │││││ ┬
 ╩ ┴ ┴┴└─┘  ┴└─┘  ┴ ┴o  ┴ ┴ ┴┴└─┘ ┴└─┘  └┴┘┴ ┴└─┘┴└─└─┘  ╩  └─┘└─┘┴─┘└─┘┘└┘└─┘o

 Welcome to all, on my humble minimal and functional (at least for me)
 Neovim configuration file.

 I hope you enjoy, and maybe take a change on trying out this wonderful
 world, be ready to fall into this rabbit hole...
--]]

--[[ Enable some experimental features ]]
--vim.loader.enable()

--[[ Map leader and local leader ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[ UI tweaks and settings ]]
vim.opt.splitright = true
vim.opt.splitbelow = true
--vim.opt.winborder = "rounded"

vim.opt.lazyredraw = true
vim.opt.signcolumn = "yes"
vim.opt.inccommand = "nosplit"
vim.opt.cursorline = true
vim.opt.shortmess:append("fsWcI")
vim.opt.scrolloff = 10
vim.opt.showtabline = 0
vim.opt.showcmd = false
vim.opt.cmdheight = 0
vim.opt.laststatus = 3

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.o.signcolumn = "yes:1"

--[[ Regex and search improvements ]]
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"

--[[ Spell & times ]]
vim.opt.spelllang = "en_us"
vim.opt.spell = false

vim.opt.updatetime = 250
vim.opt.timeoutlen = 600

--[[ Disable some language providers ]]
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

--[[ Require some utils and keymaps ]]
require("zero")
require("keys")
require("cmd")

--[[ Install lazy package manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = "plugs",
  defaults = {
    lazy = false,
    version = "*", -- try installing the latest stable version for plugins that support semver
  },
  rocks = {
    -- enabled = false,
  },
  ui = {
    border = "rounded",
    size = {
      width = 0.6,
      height = 0.5,
    },
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
  checker = {
    enabled = false,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "netrw",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

--[[ Lsp Configs ]]
local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
for name, icon in pairs(symbols) do
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

vim.diagnostic.config({
  float = {
    border = "rounded",
  },
  severity_sort = true,
  signs = true,
  update_in_insert = true,
})

--[[ Enable lsps ]]
vim.lsp.enable("luals")

