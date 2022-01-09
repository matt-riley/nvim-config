local au = require("utils.au")

local cmds = {
  astroFile = {
    { "BufEnter,BufRead,BufNewFile", "*.astro", "setlocal filetype=html" },
  },
}
au(cmds)
