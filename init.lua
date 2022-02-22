local has_impatient = pcall(require, "impatient")

if has_impatient then
  require("impatient").enable_profile()
end

local has_settings, settings = pcall(require, "settings")

if has_settings then
  settings.defaults()
end

local has_plugins, plugins = pcall(require, "plugins")

if has_plugins then
  plugins.load_plugins()
end

require("utils.globals")
