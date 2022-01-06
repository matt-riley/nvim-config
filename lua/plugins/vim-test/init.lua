local M = {}
local au = require("utils.au")

M.config = function()
  local has_vim_test = pcall(require, "vim-test")
  if not has_vim_test then
    return
  end

  vim.g.ultest_use_pty = 1
  vim.g["test#javascript#runner"] = "jest"
  vim.g["test#javascript#jest#options"] = "--color=always"
  local cmds = {
    UlTestRunner = {
      { "BufWritePost", "*", "UltestNearest" },
    },
  }

  au(cmds)
end

M.keymaps = {
  ["<leader>"] = {
    t = {
      name = "Tests",
      s = { "<cmd>UltestSummary!<cr>", "Toggle Summary" },
      n = { "<cmd>UltestNearest<cr>", "Test nearest" },
      c = { "<cmd>UltestClear<cr>", "Clear test results" },
      l = { "<cmd>UltestLast<cr>", "Test the last test" },
      t = { "<cmd>Ultest<cr>", "Run the test" },
    },
  },
}

return M
