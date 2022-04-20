local ls = require("luasnip")
local c = ls.choice_node
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local snippet = s({
  trig = "puse",
  name = "Neovim - Packer Use",
  dscr = "Add a plugin to Packer",
}, {
  t({ "use({", '\t"' }),
  i(1, "gh_user/repo"),
  t({ '", -- ' }),
  i(2, "Description of plugin"),
  t({ "" }),
  c(3, {
    sn(nil, { t({ "", "config = require('plugins." }), i(1), t({ "').config(),", "" }) }),
    sn(nil, { t({ "", 'requires = "' }), i(1), t({ '",', "" }) }),
    t({ "", "" }),
  }),
  t("})"),
})

return snippet
