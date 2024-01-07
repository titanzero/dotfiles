_G.module_loaded = function(mod_name)
  return require("lazy.core.config").plugins[mod_name] ~= nil
end
