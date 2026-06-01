local function open_lazygit()
  if vim.fn.executable("lazygit") == 0 then
    vim.notify("lazygit not found in PATH", vim.log.levels.ERROR)
    return
  end

  local width          = math.floor(vim.o.columns * 0.95)
  local height         = math.floor(vim.o.lines * 0.92)
  local col            = math.floor((vim.o.columns - width) / 2)
  local row            = math.floor((vim.o.lines - height) / 2)

  local buf            = vim.api.nvim_create_buf(false, true)
  local win            = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width    = width,
    height   = height,
    col      = col,
    row      = row,
    style    = "minimal",
    border   = "rounded",
  })

  vim.wo[win].winblend = 5

  -- Pass <Esc> through to lazygit (overrides the global terminal mapping)
  vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = buf, silent = true })

  vim.fn.termopen("lazygit", {
    on_exit = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
      if vim.api.nvim_buf_is_valid(buf) then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end,
  })

  vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("Lazygit", open_lazygit, {})
