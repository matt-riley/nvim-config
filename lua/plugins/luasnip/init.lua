local M = {}

M.config = function()
  local has_luasnip, luasnip = pcall(require, "luasnip")
  if not has_luasnip then
    return
  end

  -- luasnip.loaders.from_vscode.lazy_load()
  local snippet = luasnip.snippet
  local i = luasnip.insert_node
  local t = luasnip.text_node

  local shortcut = function(val)
    if type(val) == "string" then
      return { t({ val }), i(0) }
    end

    if type(val) == "table" then
      for k, v in ipairs(val) do
        if type(v) == "string" then
          val[k] = t({ v })
        end
      end
    end

    return val
  end

  local make = function(tbl)
    local result = {}
    for k, v in pairs(tbl) do
      table.insert(result, (snippet({ trig = k, desc = v.desc }, shortcut(v))))
    end

    return result
  end

  luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {},
  })

  local snips = {}

  snips.all = {}

  for _, ft_path in
    ipairs(vim.api.nvim_get_runtime_file("lua/plugins/luasnip/snippets/*.lua", true))
  do
    local ft = vim.fn.fnamemodify(ft_path, ":t:r")
    snips[ft] = make(loadfile(ft_path)())
  end
  luasnip.snippets = snips
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
