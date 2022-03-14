local ScalaGroup = vim.api.nvim_create_augroup("ScalaGroup", { clear = true })

vim.api.nvim_create_autocmd(
  "BufRead,BufNewFile",
  { pattern = "*.sbt, *.scala", group = ScalaGroup, command = "setlocal filetype=scala" }
)
