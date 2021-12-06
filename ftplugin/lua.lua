--[[ local au = require("utils.au")

local cmds = {
  luaFile = {
    { "BufEnter", "*.lua", "lua require('autocmds.nestjs').on_enter()" },
  },
}
au(cmds) ]]
