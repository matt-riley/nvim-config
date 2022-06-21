local M = {}

M.config = function()
  local has_kanagawa, kanagawa = pcall(require, "kanagawa")
  if not has_kanagawa then
    return
  end

  kanagawa.setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = false, -- do not set background color
    colors = {},
  })

  -- vim.cmd("colorscheme kanagawa")
end

return M
