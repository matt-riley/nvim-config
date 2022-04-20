local M = {}

M.config = function()
  local has_luasnip, luasnip = pcall(require, "luasnip")
  if not has_luasnip then
    return
  end

  -- luasnip.loaders.from_vscode.lazy_load()

  luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {},
  })

  require("plugins.luasnip.snippets.lua")
  require("plugins.luasnip.snippets.markdown")
  require("plugins.luasnip.snippets.typescript")

  vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if luasnip.choice_active() then
      luasnip.change_choice(1)
    end
  end)
  vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if luasnip.choice_active() then
      luasnip.change_choice(-1)
    end
  end)
  vim.keymap.set("i", "<c-u>", require("luasnip.extras.select_choice"))
end

return M
