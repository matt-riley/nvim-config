local au = require("utils.au")

local cmds = {
  tsFile = {
    -- { "BufEnter", "*.ts", "lua require('autocmds.typescript')()" },
    {
      "BufEnter",
      "*.service.ts,*.controller.ts,*.module.ts,*-listener.ts,*.entity.ts,*.dto.ts",
      "lua require('autocmds.nestjs').config()",
    },
  },
}
au(cmds)
