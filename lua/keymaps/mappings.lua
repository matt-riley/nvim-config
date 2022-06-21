local cokeline_mappings = require("plugins.cokeline").keymaps
local colorizer_mappings = require("plugins.colorizer").keymaps
local dap_mappings = require("plugins.dap").keymaps
local dial_mappings = require("plugins.dial").keymaps
local focus_mappings = require("plugins.focus").keymaps
local gitsigns_mappings = require("plugins.gitsigns").keymaps
local hlslens_mappings = require("plugins.hlslens").keymaps
local lsp_mappings = require("lsp.mappings")
local neogen_mappings = require("plugins.neogen").keymaps
local neorg = require("plugins.neorg").keymaps
local nvimtree_mappings = require("plugins.nvimtree").keymaps
local package_info = require("plugins.package-info").keymaps
local telescope_mappings = require("plugins.telescope").keymaps
local trouble_mappings = require("plugins.trouble").keymaps
local ts_lsp_mappings = require("plugins.lsp-ts-utils").keymaps
local twilight_mappings = require("plugins.twilight").keymaps

local extend_table = vim.tbl_deep_extend

local has_mappings, wk_mappings = pcall(
  extend_table,
  "error",
  cokeline_mappings,
  colorizer_mappings,
  dap_mappings,
  dial_mappings,
  focus_mappings,
  gitsigns_mappings,
  hlslens_mappings,
  lsp_mappings,
  neogen_mappings,
  neorg,
  nvimtree_mappings,
  package_info,
  telescope_mappings,
  trouble_mappings,
  ts_lsp_mappings,
  twilight_mappings
)

if has_mappings then
  return wk_mappings
else
  vim.notify(table.concat(wk_mappings, "\n"), "error", { title = "Error with the keymaps" })
end
