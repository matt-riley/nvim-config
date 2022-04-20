local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local snippets = {
  s("rdm", {
    t("!["),
    i(1),
    t("]("),
    i(2, "https://www.example.com/image.jpg"),
    t({ "", "", "# " }),
    i(3, "Project title"),
    t({ "", "" }),
    i(4, "One paragraph of project description goes here"),
    t({
      "",
      "",
      "## Getting Started",
      "",
      "",
      "These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.",
      "",
      "",
      "### Prerequisites",
      "",
      "",
    }),
    i(5, "What things you need to install the software and how to install them"),
    t({ "", "", "### Installing", "", "" }),

    i(6, "A step by step series of examples that tell you how to get a development env running"),
    t({ "", "", "## Running the tests", "", "" }),
    i(7, "Explain how to run the automated tests for this system"),
  }),
}

return ls.add_snippets("markdown", snippets)
