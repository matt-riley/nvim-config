local M = {}

M.config = function()
  local has_blankline, blankline = pcall(require, "indent_blankline")
  if not has_blankline then
    return
  end

  blankline.setup({
    char = "│",
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = { "alpha", "dashboard" },
  })
end

return M
