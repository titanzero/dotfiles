local _M = {}

_M.attach = function(client, buffer)
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, buffer)
  end
end

return _M
