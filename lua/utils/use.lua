local use = function(conf)
  local new_conf = {}
  if type(conf) == "string" then
    new_conf[1] = conf
  else
    new_conf = conf
  end
  new_conf.run = function(plugin)
    vim.notify(table.concat(plugin.messages, "\n"), "info", {
      title = plugin.short_name,
      timeout = 2000,
    })
    if conf.run then
      return conf.run
    end
  end
  local pkr_use = require("packer").use
  return pkr_use(new_conf)
end

return use
