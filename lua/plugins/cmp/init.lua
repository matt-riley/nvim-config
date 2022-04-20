local M = {}

M.config = function()
  local has_cmp, cmp = pcall(require, "cmp")
  local has_luasnip, luasnip = pcall(require, "luasnip")

  if not has_cmp or not has_luasnip then
    return
  end
  local lspkind = require("lspkind")
  local autopairs = require("nvim-autopairs.completion.cmp")
  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol", -- show only symbol annotations
      }),
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { "i", "s" }),
      ["<C-j>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { "i", "s" }),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    }),
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

  cmp.event:on("confirm_done", autopairs.on_confirm_done())
  require("cmp_nvim_lsp").setup()
end
return M
