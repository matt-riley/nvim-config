local ls = require("luasnip")

local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
return {
  rdm = fmt(
    "![{}]({})\n\n# {}\n\n{}\n\n## Getting Started\n\nThese instructions will get you a copy of the project up and running on your local machine for development and testing purposes.\n\n### Prerequisites\n\n{}\n\n### Installing\n\n{}\n\n## Running the tests\n\n{}",
    {
      i(1),
      i(2, "https://"),
      i(3, "Project title"),
      i(4, "One Paragraph of project description goes here"),
      i(5, "What things you need to install the software and how to install them"),
      i(6, "A step by step series of examples that tell you how to get a development env running"),
      i(7, "Explain how to run the automated tests for this system"),
    }
  ),
}
