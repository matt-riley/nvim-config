local AstroGroup = vim.api.nvim_create_augroup("AstroFile", { clear = true })

vim.api.nvim_create_autocmd(
  "BufEnter,BufRead,BufNewFile",
  { pattern = "*.astro", command = "setlocal filetype=astro", group = AstroGroup }
)
