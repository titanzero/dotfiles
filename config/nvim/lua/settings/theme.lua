-------------------------------------------------------------------------------
--                    ~~ Nicola Leonardi's VIM Configs ~~                    --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--                                Theme Config                               --
-------------------------------------------------------------------------------

----------------------------- Catpuccino Settings -----------------------------
local catppuccino = require('catppuccino')

catppuccino.setup({
  colorscheme = 'catppuccino',
  styles = {
    comments = 'italic',
    functions = 'italic',
    keywords = 'italic',
    strings = 'NONE',
    variables = 'NONE',
  },
  integrations = {
    native_lsp = {
      enabled = true,
      styles = {
        errors = 'italic',
        hints = 'italic',
        warnings = 'italic',
        information = 'italic'
      }
    },
    nvimtree = true,
    bufferline = true
  }
})

catppuccino.load()

---------------------------- Bufferline Settings ------------------------------
require('bufferline').setup {
  options = {
    separator_style = 'thin',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer'
      }
    },
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = ' '
      for e, n in pairs(diagnostics_dict) do
        local sym = e == 'error' and ' 'or (e == 'warning' and ' ' or '' )
          s = s .. n .. sym
      end
      return s
    end
  },
}
