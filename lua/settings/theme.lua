local M = {}

M.colours = function()
  local theme = vim.g.colors_name or {}
  if theme == "onenord" then
    return require("onenord.colors").load()
  elseif theme == "kanagawa" then
    local kanagawa = require("kanagawa.colors").setup()
    return {
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
  else
    return {}
  end
end

return M
