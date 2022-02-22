local M = {}

M.config = function()
  local has_alpha, alpha = pcall(require, "alpha")

  if not has_alpha then
    return
  end

  local dashboard = require("alpha.themes.dashboard")

  local headers = require("plugins.alpha.headers")

  dashboard.section.header.val = headers.doom

  dashboard.section.buttons.val = {
    dashboard.button("<Leader>ff", "  Find File          "),
    dashboard.button("<Leader>fp", "  Recent Projects    "),
    dashboard.button("<Leader>fr", "  Recently Used Files"),
  }

  local plugin_dir = string.format("%s/site/pack/packer/start/", vim.fn.stdpath("data"))
  local total_plugins = vim.fn.len(vim.fn.globpath(plugin_dir, "*", 0, 1))
  dashboard.section.footer.val = "Loaded " .. total_plugins .. " plugins  "
  alpha.setup(dashboard.opts)
end

return M
