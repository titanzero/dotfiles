return function(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end
