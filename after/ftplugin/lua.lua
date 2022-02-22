--[[ local au = require("utils.au")

local cmds = {
  luaFile = {
    { "BufEnter", "*.lua", "lua require('autocmds.lua')()" },
  },
}
au(cmds) ]]
