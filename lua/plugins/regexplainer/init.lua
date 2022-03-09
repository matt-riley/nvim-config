local M = {}

M.config = function()
  local has_regexplainer, regexplainer = pcall(require, "regexplainer")

  if not has_regexplainer then
    return
  end

  regexplainer.setup()
end

return M
