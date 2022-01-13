local M = {}

M.config = function()
  local g = vim.g
  g.doge_enable_mappings = 1
  g.doge_mapping = "<leader>d"
end
return M
