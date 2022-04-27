local M = {}

M.config = function()
  local has_neorg, neorg = pcall(require, "neorg")

  if not has_neorg then
    return
  end

  neorg.setup({
    load = {
      ["core.defaults"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            work = "~/notes/work",
            home = "~/notes/home",
          },
        },
      },
      ["core.norg.concealer"] = {},
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.integrations.telescope"] = {},
      ["core.norg.qol.toc"] = {},
      ["core.export"] = {},
    },
  })
end

return M
