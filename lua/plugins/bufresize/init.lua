local M = {}

M.config = function()
  local has_bufresize, bufresize = pcall(require, "bufresize")

  if not has_bufresize then
    return
  end
  bufresize.setup()
end

return M
