local M = {}

M.config = function()
  local has_cinnamon, cinnamon = pcall(require, "cinnamon")

  if not has_cinnamon then
    return
  end

  cinnamon.setup({
    extra_keymaps = true,
  })
end

return M
