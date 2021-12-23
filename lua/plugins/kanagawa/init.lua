local M = {}

M.config = function()
  local has_kanagawa, kanagawa = pcall(require, "kanagawa")
  if not has_kanagawa then
    return
  end

  kanagawa.setup({
    undercurl = true, -- enable undercurls
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = false, -- do not set background color
    colors = {},
    overrides = {},
  })

  vim.cmd("colorscheme kanagawa")
end

return M
