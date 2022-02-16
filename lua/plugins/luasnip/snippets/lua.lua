local ls = require("luasnip")
local snippets = {
  ls.parser.parse_snippet(
    "req",
    "local has_$1, $1 = pcall(require, $1)\nif not has_$1 then\n  return\nend"
  ),
}

return snippets
