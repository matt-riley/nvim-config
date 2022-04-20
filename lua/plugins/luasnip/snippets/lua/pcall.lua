local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local r = require("luasnip.extras").rep
local snippet = s({
  trig = "preq",
  name = "pcall require",
  dscr = "Adds a pcall for require and also adds the if statement to safely return if the dependency is not met",
}, {
  t("local has_"),
  i(1),
  t(" = pcall(require, '"),
  r(1),
  t({ "')", "", "if not has_" }),
  r(1),
  t({ " then", "\treturn", "end" }),
})

return snippet
