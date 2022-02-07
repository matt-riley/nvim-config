local M = {}

M.config = function()
  local has_cmp, cmp = pcall(require, "cmp")

  if not has_cmp then
    return
  end
  local lspkind = require("lspkind")
  local autopairs = require("nvim-autopairs.completion.cmp")
  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text", -- show only symbol annotations
      }),
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "cmp_tabnine" },
      { name = "path" },
      { name = "buffer" },
      { name = "orgmode" },
      { name = "nvim_lua" },
      { name = "luasnip" },
    },
  })

  cmp.event:on(
    "confirm_done",
    autopairs.on_confirm_done({ map_char = { tex = "" } })
  )
  require("cmp_nvim_lsp").setup()
end
return M
