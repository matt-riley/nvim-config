local M = {}

M.config = function()
  local has_dim, dim = pcall(require, "dim")

  if not has_dim then
    return
  end

  dim.setup()
end

return M
