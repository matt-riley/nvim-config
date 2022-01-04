local M = {}

M.config = function()
  local has_dap = pcall(require, "dap")
  if not has_dap then
    return
  end

  require("plugins.dap.adapters")
  require("plugins.dap.configurations")
end

return M
