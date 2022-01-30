local M = {}

--- Configures Neogen.
M.config = function()
  local has_neogen, neogen = pcall(require, "neogen")
  if not has_neogen then
    return
  end

  neogen.setup({
    enabled = true,
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
    c = { ":lua require('neogen').generate({ type = 'class' })<CR>", "Class" },
    f = {
      ":lua require('neogen').generate({ type = 'func' })<CR>",
      "Function",
    },
    t = { ":lua require('neogen').generate({ type = 'type' })<CR>", "Type" },
    n = { ":lua require('neogen').generate()<CR>", "Nearest" },
  },
}
return M
