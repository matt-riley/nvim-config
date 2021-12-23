local kanagawa = require("kanagawa.colors")
local colours = {}
colours.theme = {
  orange = kanagawa.surimiOrange,
  blue = kanagawa.dragonBlue,
  red = kanagawa.autumnRed,
  black = kanagawa.sumiInk3,
  white = kanagawa.fujiWhite,
  yellow = kanagawa.autumnYellow,
  cyan = kanagawa.waveAqua2,
  skyblue = kanagawa.springBlue,
  purple = kanagawa.oniViolet,
  magenta = kanagawa.sakuraPink,
}
colours.vi_mode = {
  NORMAL = "green",
  OP = "green",
  INSERT = "red",
  VISUAL = "blue",
  BLOCK = "blue",
  REPLACE = "magenta",
  ["V-REPLACE"] = "magenta",
  ENTER = "cyan",
  MORE = "cyan",
  SELECT = "orange",
  COMMAND = "green",
  SHELL = "green",
  TERM = "green",
  NONE = "yellow",
}

return colours
