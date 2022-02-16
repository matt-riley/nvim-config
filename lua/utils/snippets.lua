local luasnip = require("luasnip")

--@class Snippets
local M = {}

M.snip = luasnip.snippet
M.snip_node = luasnip.snippet_node
M.indent_snip_node = luasnip.indent_snippet_node
M.txt_node = luasnip.text_node
M.ins_node = luasnip.insert_node
M.func_node = luasnip.function_node
M.choice_node = luasnip.choice_node
M.dynamic_node = luasnip.dynamic_node
M.restore_node = luasnip.restore_node

--@return Snippets
return M
