vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.shortmess:append("fsWcI")

local settings = {
  --===== Line numbers
  number = true,
  relativenumber = true,

  --===== Cursor
  cursorcolumn = false,

  --===== UI improvements
  showcmd = false,
  cmdheight = 0,
  showmode = false,
  showtabline = 0,
  splitright = true,
  splitbelow = true,
  signcolumn = "yes:1",
  mouse = "a",
  syntax = "off",
  laststatus = 3,
  statuscolumn = "%=%r│%T%s",
  -- NOTE: With noice, this setting should be turned off
  lazyredraw = true,

  --===== Search
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --vimgrep",

  --===== Misc
  timeoutlen = 500,
  updatetime = 500,
  clipboard = "unnamedplus",

  --===== Spell
  spelllang = "en_us",
  spell = true,
}

for key, value in pairs(settings) do
  vim.opt[key] = value
end

local disable_providers = {
  "node",
  "perl",
  "python3",
  "python",
  "ruby",
}

for _, provider in pairs(disable_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

require("tzero")
