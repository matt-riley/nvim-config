local has_tokyonight = pcall(require, "tokyonight")

local colours = require("feline.defaults").colors
if has_tokyonight then
	local tnconfig = require("tokyonight.config")
	local tncolors = require("tokyonight.colors").setup(tnconfig)
	colours = vim.tbl_deep_extend("force", colours, tncolors)
end

return colours
