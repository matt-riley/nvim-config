local ls = require("luasnip")

local pcall = require("plugins.luasnip.snippets.lua.pcall")
local cfg = require("plugins.luasnip.snippets.lua.config")
local use = require("plugins.luasnip.snippets.lua.use")

local snippets = { cfg, pcall, use }

return ls.add_snippets("lua", snippets)
