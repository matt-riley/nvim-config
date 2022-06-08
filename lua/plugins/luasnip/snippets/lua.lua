local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
local c = ls.choice_node
-- local d = ls.dynamic_node
local r = ls.restore_node
--[[ local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l ]]

return {
  s({
    trig = "pcfg",
    name = "Neovim - Plugin Config",
    dscr = "Creates the table for plugin configuration",
  }, {
    t({ "local M = {}", "", "M.config = function()", "" }),
    i(1),
    t({ "", "end", "", "return M" }),
  }),
  s({
    trig = "preq",
    name = "pcall require",
    dscr = "Adds a pcall for require and also adds the if statement to safely return if the dependency is not met",
  }, {
    t("local has_"),
    i(1),
    t(", "),
    r(1),
    t(" = pcall(require, '"),
    r(1),
    t({ "')", "", "if not has_" }),
    r(1),
    t({ " then", "\treturn", "end" }),
  }),
  s({
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
  }),
}
