-- ~/.config/nvim/plugin/fzf-lua.lua

vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons" })

-- Deferred: fzf-lua is not needed on first draw
vim.schedule(function()
  require("nvim-web-devicons").setup()

  vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

  local fzf     = require("fzf-lua")
  local actions = require("fzf-lua.actions")

  fzf.setup({
    { "border-fused", "hide" },

    file_icon_padding = " ",

    winopts = {
      height     = 0.85,
      width      = 0.88,
      row        = 0.35,
      col        = 0.50,
      border     = "rounded",
      backdrop   = 70,
      treesitter = {
        enabled    = true,
        fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
      },
      preview    = {
        border       = "rounded",
        wrap         = false,
        hidden       = false,
        layout       = "flex",
        flip_columns = 120,
        vertical     = "down:45%",
        horizontal   = "right:55%",
        title        = true,
        title_pos    = "center",
        scrollbar    = "float",
        delay        = 20,
        winopts      = {
          number         = true,
          relativenumber = false,
          cursorline     = true,
          signcolumn     = "no",
          foldenable     = false,
        },
      },
      on_create  = function()
        -- Remap for jkl; navigation layout
        vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
        vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
      end,
    },

    keymap = {
      builtin = {
        true,
        ["<M-Esc>"]  = "hide",
        ["<F1>"]     = "toggle-help",
        ["<F2>"]     = "toggle-fullscreen",
        ["<F3>"]     = "toggle-preview-wrap",
        ["<F4>"]     = "toggle-preview",
        ["<F5>"]     = "toggle-preview-cw",
        ["<F6>"]     = "toggle-preview-behavior",
        ["<F7>"]     = "toggle-preview-ts-ctx",
        ["<S-down>"] = "preview-page-down",
        ["<S-up>"]   = "preview-page-up",
      },
      fzf = {
        true,
        ["ctrl-z"]     = "abort",
        ["ctrl-f"]     = "half-page-down",
        ["ctrl-b"]     = "half-page-up",
        ["ctrl-a"]     = "beginning-of-line",
        ["ctrl-e"]     = "end-of-line",
        ["alt-a"]      = "toggle-all",
        ["shift-down"] = "preview-page-down",
        ["shift-up"]   = "preview-page-up",
      },
    },

    actions = {
      files = {
        true,
        ["enter"]  = actions.file_edit_or_qf,
        ["ctrl-s"] = actions.file_split,
        ["ctrl-v"] = actions.file_vsplit,
        ["ctrl-t"] = actions.file_tabedit,
        ["alt-q"]  = actions.file_sel_to_qf,
        ["alt-i"]  = actions.toggle_ignore,
        ["alt-h"]  = actions.toggle_hidden,
      },
    },

    fzf_opts = {
      ["--ansi"]           = true,
      ["--info"]           = "inline-right",
      ["--height"]         = "100%",
      ["--layout"]         = "reverse",
      ["--border"]         = "none",
      ["--highlight-line"] = true,
      ["--scroll-off"]     = 3,
    },

    -- Auto-generate fzf colors from the active Neovim colorscheme
    fzf_colors = true,

    previewers = {
      bat = {
        cmd  = "bat",
        args = "--color=always --style=numbers,changes",
      },
      builtin = {
        syntax          = true,
        syntax_limit_b  = 1024 * 1024,
        limit_b         = 1024 * 1024 * 10,
        treesitter      = {
          enabled  = true,
          disabled = { "help" },
          context  = { max_lines = 1, trim_scope = "inner" },
        },
        toggle_behavior = "default",
        render_markdown = { enabled = true, filetypes = { ["markdown"] = true } },
      },
    },

    files = {
      multiprocess           = true,
      git_icons              = false,
      file_icons             = true,
      color_icons            = true,
      hidden                 = true,
      rg_opts                = [[--color=never --files -g "!.git" -g "!node_modules"]],
      fd_opts                = [[--color=never --type f --type l --exclude .git --exclude node_modules]],
      cwd_prompt             = true,
      cwd_prompt_shorten_len = 32,
      cwd_prompt_shorten_val = 1,
      formatter              = "path.filename_first",
    },

    grep = {
      multiprocess   = true,
      file_icons     = true,
      color_icons    = true,
      rg_opts        = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
      rg_glob        = true,
      glob_flag      = "--iglob",
      glob_separator = "%s%-%-",
      hidden         = false,
      actions        = {
        ["ctrl-g"] = { actions.grep_lgrep },
      },
    },

    lsp = {
      async_or_timeout   = 5000,
      file_icons         = true,
      git_icons          = false,
      jump1              = true,
      jump1_action       = actions.file_edit,
      -- Exclude current declaration from results to avoid self-reference noise
      includeDeclaration = false,
      symbols            = {
        async_or_timeout = true,
        symbol_style     = 1,
        symbol_hl        = function(s) return "@" .. s:lower() end,
        symbol_fmt       = function(s, _) return "[" .. s .. "]" end,
        child_prefix     = true,
        fzf_opts         = { ["--tiebreak"] = "begin" },
      },
      code_actions       = { previewer = "codeaction" },
      finder             = { async = true, silent = true, separator = "| " },
    },

    diagnostics = {
      file_icons     = false,
      diag_icons     = true,
      diag_source    = true,
      diag_code      = true,
      multiline      = 2,
      color_headings = true,
    },

    buffers = {
      sort_lastused = true,
      show_unloaded = true,
      file_icons    = true,
      color_icons   = true,
      actions       = {
        ["ctrl-x"] = { fn = actions.buf_del, reload = true },
      },
    },

    git = {
      status = {
        multiprocess = true,
        previewer    = "git_diff",
        actions      = {
          ["right"]  = { fn = actions.git_unstage, reload = true },
          ["left"]   = { fn = actions.git_stage, reload = true },
          ["ctrl-x"] = { fn = actions.git_reset, reload = true },
        },
      },
      commits = {
        actions = {
          ["enter"]  = actions.git_checkout,
          ["ctrl-y"] = { fn = actions.git_yank_commit, exec_silent = true },
        },
      },
      branches = {
        actions = {
          ["enter"]  = actions.git_switch,
          ["ctrl-x"] = { fn = actions.git_branch_del, reload = true },
          ["ctrl-a"] = { fn = actions.git_branch_add, field_index = "{q}", reload = true },
        },
      },
    },

    oldfiles = {
      cwd_only                = false,
      stat_file               = true,
      include_current_session = true,
      ignore_current_buffer   = true,
    },

    helptags = { previewer = "help_native" },
    manpages = { previewer = "man_native" },
  })

  -- Register as vim.ui.select handler (LSP code actions, rename, etc.)
  fzf.register_ui_select()
end)
