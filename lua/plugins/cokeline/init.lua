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
      fg = function(buff)
        return buff.is_focused and colours.normal_fg or colours.comment_fg
      end,
      bg = function(buff)
        return buff.is_focused and colours.normal_bg or colours.column_bg
      end,
      style = function(buff)
        return buff.is_focused and "bold" or "italic"
      end,
    },
    components = {
      components.double_space,
      -- components.left_corner,
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
      -- components.right_corner,
    },
  })
end

M.keymaps = {
  ["<leader>b"] = {
    name = "Cokeline Buffers",
    c = { "<Plug>(cokeline-pick-close)", "Pick Close" },
    f = { "<Plug>(cokeline-pick-focus)", "Pick Focus" },
    n = { "<Plug>(cokeline-focus-next)", "Next" },
    p = { "<Plug>(cokeline-focus-prev)", "Prev" },
  },
}

return M
