local M = {}

M.config = function()
  local has_focus, focus = pcall(require, "focus")

  if not has_focus then
    return
  end

  focus.setup({
    excluded_filetypes = { "alpha", "dashboard" },
    hybridnumber = false,
  })
end

M.keymaps = {
  ["<leader>s"] = {
    name = "Splits",
    h = {
      ":FocusSplitLeft<CR>",
      "Split left",
    },
    j = {
      ":FocusSplitDown<CR>",
      "Split down",
    },
    k = {
      ":FocusSplitUp<CR>",
      "Split up",
    },
    l = {
      ":FocusSplitRight<CR>",
      "Split right",
    },
  },
}

return M
