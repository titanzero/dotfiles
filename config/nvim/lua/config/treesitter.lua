-------------------------------------------------------------------------------
--                    ~~ Nicola Leonardi's VIM Configs ~~                    --
-------------------------------------------------------------------------------

require('nvim-treesitter.configs').setup{
  ensure_installed = {'lua', 'c_sharp'},
  highlight = {
    enable = true
  }
}
