local nestJsGroup = vim.api.nvim_create_augroup("NestJsGroup", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.service.ts,*.service.spec.ts,*.controller.ts,*.module.ts,*-listener.ts,*.entity.ts,*.dto.ts",
  group = nestJsGroup,
  callback = function()
    require("autocmds.nestjs").config()
  end,
})
