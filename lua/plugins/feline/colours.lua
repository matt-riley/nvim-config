local theme = require("onenord.colors").load()
local colours = {}

colours.theme = theme
colours.vi_mode = {
  NORMAL = colours.theme.green,
  OP = colours.theme.green,
  INSERT = colours.theme.red,
  VISUAL = colours.theme.blue,
  BLOCK = colours.theme.blue,
  REPLACE = colours.theme.magenta,
  ["V-REPLACE"] = colours.theme.magenta,
  ENTER = colours.theme.cyan,
  MORE = colours.theme.cyan,
  SELECT = colours.theme.orange,
  COMMAND = colours.theme.green,
  SHELL = colours.theme.green,
  TERM = colours.theme.green,
  NONE = colours.theme.yellow,
}

return colours
