local M = {}

M.config = function()
  local has_heir, heirline = pcall(require, "heirline")
  if not has_heir then
    return
  end

  local conditions = require("heirline.conditions")
  local utils = require("heirline.utils")
end

return M
