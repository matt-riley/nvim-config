local M = {}

M.config = function()
  local has_autopairs, autopairs = pcall(require, "nvim-autopairs")

  if not has_autopairs then
    return
  end

  local rule = require("nvim-autopairs.rule")
  autopairs.setup({
    active = true,
    on_config_done = nil,
    check_ts = true,
    ts_config = {
      lua = { "string" },
      javascript = { "string", "template_string" },
    },
    map_char = {
      all = "(",
      tex = "{",
    },
    enable_check_bracket_line = false,
    enable_afterquote = true,
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "Search",
      highlight_grey = "Comment",
    },
  })

  autopairs.add_rule(
    rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
      :use_regex(true)
      :set_end_pair_length(2)
  )
end

return M
