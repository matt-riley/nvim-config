local M = {}

M.config = function()
  local has_colorizer, colorizer = pcall(require, "colorizer")
  if not has_colorizer then
    return
  end

  return colorizer.setup({
    "css",
    "javascript",
    "typescript",
    "html",
    "svelte",
    "scss",
  })
end

M.keymaps = {
  ["<leader>uc"] = {
    ":ColorizerToggle",
    "Colorizer Toggle",
  },
}

return M
