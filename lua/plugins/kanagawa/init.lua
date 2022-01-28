local M = {}

M.config = function()
  local has_kanagawa, kanagawa = pcall(require, "kanagawa")
  if not has_kanagawa then
    return
  end

  local default_colours = require("kanagawa.colors").setup()

  local overrides = {
    CopilotSuggestion = { fg = default_colours.sumiInk4 },
    TelescopeBorder = {
      fg = default_colours.sumiInk4,
    },
    TelescopePromptPrefix = { fg = default_colours.waveRed },
    TelescopeNormal = { bg = default_colours.sumiInk1 },
  }

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
    overrides = overrides,
  })

  vim.cmd("colorscheme kanagawa")
end

return M
