-------------------------------------------------------------------------------
--                    ~~ Nicola Leonardi's VIM Configs ~~                    --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--                                 LSP Config                                --
-------------------------------------------------------------------------------

------------------------------------ Compe ------------------------------------
require('compe').setup{
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
  };
}

----------------------------------- LSPKind -----------------------------------
require('lspkind').init({
    preset = 'default',
    symbol_map = {
      Text = '',
      Method = '',
      Function = '',
      Constructor = '',
      Field = 'ﰠ',
      Variable = '',
      Class = 'ﴯ',
      Interface = '',
      Module = '',
      Property = 'ﰠ',
      Unit = '塞',
      Value = '',
      Enum = '',
      Keyword = '',
      Snippet = '',
      Color = '',
      File = '',
      Reference = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = 'פּ',
      Event = '',
      Operator = '',
      TypeParameter = ''
    },
})

------------------------------------- LUA -------------------------------------
local sumneko_root_path =
  vim.fn.stdpath('data') .. '/site/pack/packer/start/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/macOS/lua-language-server'

require('lspconfig').sumneko_lua.setup{
  cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
  settings = {
    Lua = {
      completion = {kewordSnippet = 'Disable'},
      diagnostics = {
        enable = true,
        globals = {'use', 'vim'}
      },
      runtime = {
        version = 'LuaJIT',
        path = {'?.lua', '?/init.lua', 'lua/?.lua'}
      },
      telemetry = {
        enable = false
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      }
    }
  }
}

---------------------------------- C# Roslyn ----------------------------------
local pid = vim.fn.getpid()
local omnisharp_bin =
  vim.fn.stdpath('data') .. '/omnisharp/run'

require('lspconfig').omnisharp.setup{
  cmd = {omnisharp_bin, '--languageserver' , '--hostPID', tostring(pid)},
}

