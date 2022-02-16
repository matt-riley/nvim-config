local has_luasnip = require("luasnip")

if not has_luasnip then
  return
end

local Snippets = require("utils.snippets")

local nestSnippets = {
  Snippets.snip({
    trig = "sts",
    name = "Service Test",
    dscr = "Creates the boilerplate for unit testing a service",
  }, Snippets.ins_node(1)),
}

return nestSnippets
