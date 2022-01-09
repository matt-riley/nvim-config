--[[ local au = require("utils.au")

local cmds = {
  tsFile = {
    { "BufEnter", "*.ts", "lua require('autocmds.typescript')()" },
    {
      "BufWritePre",
      "*.controller.ts",
      "lua require('autocmds.nestjs').controller()",
    },
  },
}
au(cmds) ]]
