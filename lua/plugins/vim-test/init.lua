local M = {}

M.config = function()
  local has_vim_test = pcall(require, "vim-test")
  if not has_vim_test then
    return
  end
end

M.keymaps = {}

return M
