local kanagawa = require("kanagawa.colors").setup()
local colours = {}
colours.theme = {
  orange = kanagawa.roninYellow,
  blue = kanagawa.dragonBlue,
  red = kanagawa.peachRed,
  black = kanagawa.sumiInk3,
  white = kanagawa.fujiWhite,
  yellow = kanagawa.autumnYellow,
  cyan = kanagawa.waveAqua2,
  skyblue = kanagawa.springBlue,
  purple = kanagawa.oniViolet,
  magenta = kanagawa.sakuraPink,
  green = kanagawa.autumnGreen,
  grey = kanagawa.oldWhite,
}
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
