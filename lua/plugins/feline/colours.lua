local theme = require("onenord.colors").load()
local p = require("rose-pine.palette")
local colours = {}

colours.theme = vim.tbl_deep_extend("force", theme, p)

colours.vi_mode = {
  NORMAL = colours.theme.iris,
  OP = colours.theme.foam,
  INSERT = colours.theme.love,
  VISUAL = colours.theme.rose,
  BLOCK = colours.theme.blue,
  REPLACE = colours.theme.magenta,
  ["V-REPLACE"] = colours.theme.magenta,
  ENTER = colours.theme.cyan,
  MORE = colours.theme.cyan,
  SELECT = colours.theme.orange,
  COMMAND = colours.theme.subtle,
  SHELL = colours.theme.subtle,
  TERM = colours.theme.subtle,
  NONE = colours.theme.yellow,
}

-- local theme = require("rose-colours.theme.ne.colours.theme.lette")
-- local colours = {}
-- colours.theme = theme
-- colours.vi_mode({
--   NORMAL = colours.theme.foam,
-- })

return colours
