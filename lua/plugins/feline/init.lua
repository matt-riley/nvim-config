local M = {}

M.config = function()
  local has_feline, feline = pcall(require, "feline")

  if not has_feline then
    return
  end

  feline.setup({
    components = require("plugins.feline.components"),
    disable = require("plugins.feline.disable"),
    vi_mode_colors = require("plugins.feline.colours").vi_mode,
  })
end

return M
