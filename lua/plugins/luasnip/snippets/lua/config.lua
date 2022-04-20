local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local snippet = s({
  trig = "pcfg",
  name = "Neovim - Plugin Config",
  dscr = "Creates the table for plugin configuration",
}, {
  t({ "local M = {}", "", "M.config = function()", "" }),
  i(1),
  t({ "", "end", "", "return M" }),
})

return snippet
