local M = {}

M.config = function()
  local has_neorg, neorg = pcall(require, "neorg")
  if not has_neorg then
    return
  end

  neorg.setup({
    load = {
      ["core.defaults"] = {}, -- Load all the default modules
      ["core.norg.concealer"] = {}, -- Allows for use of icons
      ["core.norg.dirman"] = { -- Manage your directories with Neorg
        config = {
          workspaces = {
            my_workspace = "~/neorg",
          },
        },
      },
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.keybinds"] = {
        config = {
          default_keybinds = true,
          neorg_leader = "<Leader>o",
        },
      },
    },
  })
end

return M
