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
    TelescopeSelectionCaret = { fg = default_colours.surimiOrange },
    --[[ CmpItemAbbrDeprecated = { bg = nil, gui = "strikethrough", fg = "#808080" },
    CmpItemAbbrMatch = { bg = "NONE", fg = "#569CD6" },
    CmpItemAbbrMatchFuzzy = { bg = "NONE", fg = "#569CD6" },
    CmpItemKindVariable = { bg = "NONE", fg = "#9CDCFE" },
    CmpItemKindInterface = { bg = "NONE", fg = "#9CDCFE" },
    CmpItemKindText = { bg = "NONE", fg = "#9CDCFE" },

    CmpItemKindFunction = { bg = "NONE", fg = "#C586C0" },
    CmpItemKindMethod = { bg = "NONE", fg = "#C586C0" },

    CmpItemKindKeyword = { bg = "NONE", fg = "#D4D4D4" },
    CmpItemKindProperty = { bg = "NONE", fg = "#D4D4D4" },
    CmpItemKindUnit = { bg = "NONE", fg = "#D4D4D4" }, ]]
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
