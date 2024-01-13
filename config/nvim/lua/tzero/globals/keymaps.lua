local _M = {  }

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

--- General key maps, loaded with VeryLazy event
_M.general = function()
  --===== ESC clear hlsearch and Notify
  map("n", "<Esc>", "", {
    callback = function()
      vim.cmd("noh")
    end,
    desc = "Dismiss hlsearch",
    noremap = true,
    silent = true,
  })

  --===== <leader>w to quit buffer
  map("n", "<leader>w", ":bdelete!<cr>", opts)

  --===== Map telescope
  map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
  map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
  map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
  map("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
  map("n", "z=", ":Telescope spell_suggest<cr>", opts)

  --===== Better window management
  map("n", "<c-h>", "<c-w>h", opts)
  map("n", "<c-l>", "<c-w>l", opts)
  map("n", "<c-j>", "<c-w>j", opts)
  map("n", "<c-k>", "<c-w>k", opts)
end

--- Attach specific key maps to buffers with gitsigns
-- @param bufnr Buffer number to which attach to
_M.gitsigns_buf_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  map("n", "[c", function()
    if vim.wo.diff then return "[c" end

    vim.schedule(function() gs.prev_hunk() end)
    return "<ignore>"
  end, { unpack(opts), buffer = bufnr, expr = true })

  map("n", "]c", function()
    if vim.wo.diff then return "]c" end

    vim.schedule(function() gs.next_hunk() end)
    return "<ignore>"
  end, { unpack(opts), buffer = bufnr, expr = true })
end

return _M
