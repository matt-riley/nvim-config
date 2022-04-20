local ls = require("luasnip")

local nestServiceTest = require("plugins.luasnip.snippets.typescript.nest-service-test")

local snippets = { nestServiceTest }

return ls.add_snippets("typescript", snippets)
