local ls = require("luasnip")
local s = ls.snippet
--[[ local sn = ls.snippet_node
local isn = ls.indent_snippet_node ]]
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
--[[ local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l ]]

local class_name = require("plugins.luasnip.utils.class_name")
local import_path = require("plugins.luasnip.utils.import_path")
local var_name = require("plugins.luasnip.utils.var_name")
local get_functions = require("plugins.luasnip.utils.get_functions")

return {
  s("nnst", {
    t("import {"),
    c(1, { f(class_name, {}), i(nil, "Enter a class name") }),
    t('} from "'),
    f(import_path, {}),
    t({ '";', "", "import { Test } from '@nestjs/testing';", "", 'describe("' }),
    r(1),
    t({ '", () => {', "\tlet " }),
    f(var_name, { 1 }),
    t(": "),
    r(1),
    t({
      ";",
      "",
      "beforeEach(async () => {",
      "\tjest.resetAllMocks();",
      "",
      "const moduleRef = await Test.createTestingModule({",
      "\tproviders: [",
      "\t",
    }),
    r(1),
    t({ ",", "]", "}).compile();", "" }),
    f(var_name, { 1 }),
    t(" = moduleRef.get<"),
    r(1),
    t(">("),
    r(1),
    t({ ");", "", "})", "", "it('should create an instance of " }),
    r(1),
    t({ " with mock dependencies', () => {", "\texpect(" }),
    f(var_name, { 1 }),
    t(").toBeInstanceOf("),
    r(1),
    t({ ");", "});", "" }),
    d(2, get_functions, { 1 }),
  }),
}
