local M = {}

M.config = function()
  local has_feline, feline = pcall(require, "feline")
  local has_kanagawa = pcall(require, "kanagawa")

  if not has_feline and not has_kanagawa then
    return
  end

  feline.setup({
    components = require("plugins.feline.components"),
    disable = require("plugins.feline.disable"),
    vi_mode_colors = require("plugins.feline.colours").vi_mode,
  })
end

return M
