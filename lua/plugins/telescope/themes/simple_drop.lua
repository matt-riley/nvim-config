local M = {}
M.theme = function()
  return require("telescope.themes").get_dropdown({
    borderchars = {
      prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
      results = { " ", " ", " ", " ", " ", " ", " ", " " },
      preview = { " ", " ", " ", " ", " ", " ", " ", " " },
    },
    width = 0.8,
    winblend = 4,
    results_height = 10,
    previewer = false,
    prompt_title = false,
    results_title = false,
    show_line = false,
  })
end

M.oldfiles = function()
  local opts = vim.tbl_deep_extend("force", M.theme(), { only_cwd = true })
  require("telescope.builtin").oldfiles(opts)
end
return M
