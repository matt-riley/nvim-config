local M = {}

M.config = function()
  local has_pine, rosepine = pcall(require, "rose-pine")
  if not has_pine then
    return
  end

  rosepine.setup({
    dark_variant = "moon",
  })

  vim.cmd("colorscheme rose-pine")
end

return M
