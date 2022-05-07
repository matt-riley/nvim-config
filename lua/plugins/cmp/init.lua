local M = {}

M.config = function()
  local has_cmp, cmp = pcall(require, "cmp")
  local has_luasnip, luasnip = pcall(require, "luasnip")

  if not has_cmp or not has_luasnip then
    return
  end

  local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  }

  local autopairs = require("nvim-autopairs.completion.cmp")
  cmp.setup({
    completion = {
      completeopt = "menu,menuone,noinsert",
    },
    exprimental = {
      native_menu = false,
      ghost_text = false,
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = kind_icons[vim_item.kind] or ""
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
        })[entry.source.name] or "[]"
        return vim_item
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
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer", max_item_count = 3 },
      { name = "path" },
      { name = "orgmode" },
      { name = "cmp_tabnine" },
      { name = "nvim_lsp_singature_help" },
    },
    window = {
      completion = {
        border = nil,
      },
    },
  })

  cmp.setup.cmdline("/", {
    view = {
      entries = "custom",
    },
  })
  cmp.event:on("confirm_done", autopairs.on_confirm_done())
  require("cmp_nvim_lsp").setup()
end

return M
