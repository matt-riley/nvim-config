local M = {}

M.config = function()
  -- specific vim options for the nightmare that is nestjs
  local options = {
    shiftwidth = 4,
    softtabstop = 4,
    tabstop = 4,
  }

  for name, value in pairs(options) do
    vim.opt[name] = value
  end

  -- nestjs snippets
  local has_luasnip, luasnip = require("luasnip")

  if not has_luasnip then
    return
  end

  --[[ if not luasnip.snippets.typescript then
    local snips = { typescript = require("snippets.nestjs") }
    vim.tbl_deep_extend("force", luasnip.snippets, snips)
  end ]]
  -- luasnip.snippets.typescript = {
  --   s({
  --     trig = "sts",
  --     name = "Service Test",
  --     dscr = "Creates the boilerplate for unit testing a service",
  --   }),
  -- }
end

return M
