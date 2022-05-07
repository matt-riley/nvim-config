local M = {}

M.config = function()
  local has_gitconflict, gitconflict = pcall(require, "git-conflict")

  if not has_gitconflict then
    return
  end

  gitconflict.setup()
end

return M
