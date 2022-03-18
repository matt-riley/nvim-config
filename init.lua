local has_impatient = pcall(require, "impatient")

if has_impatient then
  require("impatient").enable_profile()
end

local builtins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logiPat",
  "matchit",
  "matchparen",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "rrhelper",
  "spellfile_plugin",
  "tar",
  "tarPlugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in ipairs(builtins) do
  vim.g["loaded_" .. plugin] = 1
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
