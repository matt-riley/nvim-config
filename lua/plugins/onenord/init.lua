local M = {}

M.config = function()
  local has_onenord, onenord = pcall(require, "onenord")

  if not has_onenord then
    return
  end
  onenord.setup({
    theme = "dark",
    styles = {
      comments = "italic",
      functions = "italic",
      diagnostics = "undercurl",
    },
  })
end

return M
