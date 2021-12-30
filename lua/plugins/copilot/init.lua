local M = {}

M.config = function()
  local has_copilot = pcall(require, "copilot")
  if not has_copilot then
    return
  end

  vim.cmd('imap <silent><script><expr> <C-I> copilot#Accept("")')
  vim.cmd("let g:copilot_no_tab_map = v:true")
end

return M
