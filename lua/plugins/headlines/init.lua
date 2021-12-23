local M = {}

M.config = function()
  local has_headlines, headlines = pcall(require, "headlines")
  if not has_headlines then
    return
  end
  return headlines.setup({
    markdown = {
      source_pattern_start = "^```",
      source_pattern_end = "^```$",
      dash_pattern = "^---+$",
      headline_pattern = "^#+",
      headline_signs = { "Headline" },
      codeblock_sign = "CodeBlock",
      dash_highlight = "Dash",
    },
  })
end

return M
