local ls = require("luasnip")
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local snippets = {
  preq = fmt(
    "local has_{}, {} = pcall(require, '{}')\n\nif not has_{} then\n  return\nend\n\n",
    { i(1), rep(1), rep(1), rep(1) }
  ),
}

return snippets
