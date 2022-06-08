local M = {}

--- Configures Neogen.
M.config = function()
  local has_neogen, neogen = pcall(require, "neogen")
  if not has_neogen then
    return
  end

  neogen.setup({
    enabled = true,
    snippet_engine = "luasnip",
    languages = {
      lua = {
        template = { annotation_convention = "ldoc" },
      },
    },
  })
end

--- Keymaps for Neogen
M.keymaps = {
  ["<leader>d"] = {
    name = "Generate documentation",
    c = { "<cmd>Neogen class<CR>", "Class" },
    f = { "<cmd>Neogen func<CR>", "Function" },
    t = { "<cmd>Neogen type<CR>", "Type" },
    n = { ":lua require('neogen').generate()<CR>", "Nearest" },
  },
}
return M
