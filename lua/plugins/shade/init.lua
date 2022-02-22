local M = {}

M.config = function()
  local has_shade, shade = pcall(require, "shade")

  if not has_shade then
    return
  end

  shade.setup({
    overlay_opacity = 25,
    keys = {
      toggle = "<Leader>us",
    },
  })
end

return M
