local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 0,
  confirm = true,
  completeopt = { "menu", "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  incsearch = true,
  hlsearch = true,
  inccommand = "nosplit",
  ignorecase = true,
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --vimgrep",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = false,
  laststatus = 3,
  background = "dark",
  selection = "exclusive",
  virtualedit = "onemore",
  showcmd = false,
  title = true,
  titlestring = "%<%F%=%l/%L - nvim",
  linespace = 8,
  mousemoveevent = true,
  mouse = "",
  syntax = "off",
  spelllang = { "en" },

  foldlevelstart = 99,
  foldlevel = 99,
  foldenable = true,
  foldcolumn = "1",
  fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
  },

  sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
}


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.shortmess:append("cI")
vim.opt.list = true

for k, v in pairs(options) do
  vim.opt[k] = v
end

local disable_providers = {
  "node",
  "perl",
  "python3",
  "python",
  "ruby"
}

for _, provider in pairs(disable_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
