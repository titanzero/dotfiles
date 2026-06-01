local map = function(mode, keys, cmd, desc)
  vim.keymap.set(mode, keys, cmd, { silent = true, desc = desc })
end

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- FzfLua files
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", "Find files")
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", "Recent files")
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", "Buffers")
map("n", "<leader>fg", "<cmd>FzfLua git_files<cr>", "Git files")

-- FzfLua search
map("n", "<leader>sg", "<cmd>FzfLua live_grep<cr>", "Live grep")
map("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", "Grep word")
map("v", "<leader>sw", "<cmd>FzfLua grep_visual<cr>", "Grep visual")
map("n", "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", "Search buffer")

-- FzfLua LSP
map("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", "Go to definition")
map("n", "gr", "<cmd>FzfLua lsp_references<cr>", "References")
map("n", "gi", "<cmd>FzfLua lsp_implementations<cr>", "Implementations")
map("n", "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", "Document symbols")
map("n", "<leader>sS", "<cmd>FzfLua lsp_workspace_symbols<cr>", "Workspace symbols")
map("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", "Code actions")
map("n", "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", "Diagnostics")

-- FzfLua git
map("n", "<leader>gc", "<cmd>FzfLua git_commits<cr>", "Git commits")
map("n", "<leader>gs", "<cmd>FzfLua git_status<cr>", "Git status")
map("n", "<leader>gb", "<cmd>FzfLua git_branches<cr>", "Git branches")

-- FzfLua misc
map("n", "<leader>:", "<cmd>FzfLua command_history<cr>", "Command history")
map("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", "Help tags")
map("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>", "Keymaps")
map("n", "<leader>fc", "<cmd>FzfLua colorschemes<cr>", "Colorschemes")
map("n", "<leader><leader>", "<cmd>FzfLua resume<cr>", "Resume last picker")

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Netrw
map("n", "<leader>e", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "netrw" then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  vim.cmd("Lexplore")
end, "Toggle file explorer")

-- Lazygit
map("n", "<leader>lg", "<cmd>Lazygit<cr>", "Lazygit")
