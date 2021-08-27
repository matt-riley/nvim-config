local nvimtree_mappings = require("plugins.nvimtree").keymaps
local trouble_mappings = require("plugins.trouble").keymaps
local lsp_mappings = require("settings.lsp.mappings")
local package_info = require("plugins.package-info").keymaps
local telescope_mappings = require("plugins.telescope").keymaps
local gitsigns_mappings = require("plugins.gitsigns").keymaps

local extend_table = vim.tbl_deep_extend
local has_notify, notify = pcall(require, "notify")

local has_mappings, wk_mappings = pcall(
	extend_table,
	"error",
	nvimtree_mappings,
	lsp_mappings,
	trouble_mappings,
	telescope_mappings,
	package_info,
	gitsigns_mappings
)

if has_mappings then
	return wk_mappings
else
	if has_notify then
		notify(table.concat(wk_mappings, "\n"), "error", { title = "Error with the keymaps" })
	end
end
