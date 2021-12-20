local M = {}

M.config = function()
  local has_coke, cokeline = pcall(require, "cokeline")
  if not has_coke then
    return
  end

  local colours = require("plugins.cokeline.colours")
  local components = require("plugins.cokeline.components")

  cokeline.setup({
    buffers = {
      filter_valid = function(buffer)
        return buffer.type ~= "terminal"
      end,
      new_buffers_position = "next",
    },
    default_hl = {
      focused = {
        fg = colours.normal_fg,
        bg = colours.column_bg,
        style = "bold",
      },
      unfocused = {
        fg = colours.comment_fg,
        bg = colours.column_bg,
      },
    },
    components = {
      components.double_space,
      components.separator,
      components.space,
      components.devicon,
      components.space,
      components.unique_prefix,
      components.filename,
      components.space,
      components.diagnostics,
      components.space,
      components.close_or_unsaved,
      components.double_space,
    },
  })
end

M.keymaps = {
  ["<leader>b"] = {
    name = "Cokeline Buffers",
    n = { "<Plug>(cokeline-focus-next)", "Next" },
    p = { "<Plug>(cokeline-focus-prev)", "Prev" },
    f = { "<Plug>(cokeline-pick-focus)", "Pick Focus" },
    c = { "<Plug>(cokeline-pick-close)", "Pick Close" },
  },
}

return M
