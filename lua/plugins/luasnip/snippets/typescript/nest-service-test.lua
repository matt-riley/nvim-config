local ls = require("luasnip")

local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local s = ls.snippet
local t = ls.text_node

local rep = require("luasnip.extras").rep

local class_name = require("plugins.luasnip.utils.class_name")
local import_path = require("plugins.luasnip.utils.import_path")
local var_name = require("plugins.luasnip.utils.var_name")
local get_functions = require("plugins.luasnip.utils.get_functions")

local M = s("nnst", {
  t("import {"),
  c(1, { f(class_name, {}), i(nil, "Enter a class name") }),
  t('} from "'),
  f(import_path, {}),
  t({ '";', "", "import { Test } from '@nestjs/testing';", "", 'describe("' }),
  rep(1),
  t({ '", () => {', "\tlet " }),
  f(var_name, { 1 }),
  t(": "),
  rep(1),
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
  rep(1),
  t({ ",", "]", "}).compile();", "" }),
  f(var_name, { 1 }),
  t(" = moduleRef.get<"),
  rep(1),
  t(">("),
  rep(1),
  t({ ");", "", "})", "", "it('should create an instance of " }),
  rep(1),
  t({ " with mock dependencies', () => {", "\texpect(" }),
  f(var_name, { 1 }),
  t(").toBeInstanceOf("),
  rep(1),
  t({ ");", "});", "" }),
  d(2, get_functions, { 1 }),
})

return M
