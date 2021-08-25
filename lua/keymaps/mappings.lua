local nvimtree_mappings = require("plugins.nvimtree").keymaps
local trouble_mappings = require("plugins.trouble").keymaps
local lsp_mappings = require("settings.lsp.mappings")

local wk_mappings = vim.tbl_deep_extend("error", nvimtree_mappings, lsp_mappings, trouble_mappings)

return wk_mappings
