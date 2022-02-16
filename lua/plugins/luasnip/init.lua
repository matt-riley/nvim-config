local M = {}

M.config = function()
  local has_luasnip, luasnip = pcall(require, "luasnip")
  if not has_luasnip then
    return
  end

  -- luasnip.loaders.from_vscode.lazy_load()
  local snippet = luasnip.snippet
  local insert = luasnip.insert_node
  local rep = require("luasnip.extras").rep
  local fmt = require("luasnip.extras.fmt").fmt

  luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
  })
  luasnip.snippets = {
    all = {
      snippet(
        "rdm",
        fmt(
          "![{}]({})\n\n#{}\n\n{}\n\n## Getting Started\n\nThese instructions will get you a copy of the project up and running on your local machine for development and testing purposes.\n\n### Prerequisites\n\n{}\n\n### Installing\n\n{}\n\n## Running the tests\n\n{}",
          {
            insert(1),
            insert(2, "https://"),
            insert(3, "Project title"),
            insert(4, "One Paragraph of project description goes here"),
            insert(
              5,
              "What things you need to install the software and how to install them"
            ),
            insert(
              6,
              "A step by step series of examples that tell you how to get a development env running"
            ),
            insert(7, "Explain how to run the automated tests for this system"),
          }
        )
      ),
    },
    lua = {
      snippet(
        "preq",
        fmt(
          "local has_{}, {} = require('{}')\n\nif not has_{} then\n  return\nend\n\n",
          { insert(1), rep(1), rep(1), rep(1) }
        )
      ),
    },
  }
end

return M
