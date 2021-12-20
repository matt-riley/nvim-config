local M = {}

M.config = function()
  local has_autopairs, autopairs = pcall(require, "autopairs")

  if not has_autopairs then
    return
  end

  autopairs.setup({
    check_ts = true,
    enable_check_bracket_line = false,
  })
end

return M
