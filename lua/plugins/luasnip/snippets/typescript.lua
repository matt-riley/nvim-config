local ls = require("luasnip")

local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

local class_name = require("plugins.luasnip.utils.class_name")
local import_path = require("plugins.luasnip.utils.import_path")
local var_name = require("plugins.luasnip.utils.var_name")
local get_functions = require("plugins.luasnip.utils.get_functions")

return {
  nnst = fmt(
    [[
    import {{ {} }} from "{}";

    import {{ Test }} from '@nestjs/testing';

    describe("{}", ()=> {{
      let {}: {};

      beforeEach(async () => {{
        jest.resetAllMocks();

        const moduleRef = await Test.createTestingModule({{
          providers: [
                {},
          ]
        }}).compile();

        {} = moduleRef.get<{}>({});

      }})

      it('should create an instance of {} with mock dependencies', () => {{
        expect({}).toBeInstanceOf({});
      }});

      {}
    }})
    ]],
    {
      c(1, { f(class_name, {}), i(nil, "Enter a class name") }),
      f(import_path, {}),
      rep(1),
      f(var_name, { 1 }),
      rep(1),
      rep(1),
      f(var_name, { 1 }),
      rep(1),
      rep(1),
      rep(1),
      f(var_name, { 1 }),
      rep(1),
      d(2, get_functions, { 1 }),
    }
  ),
}
