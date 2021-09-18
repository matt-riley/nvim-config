local M = {}

M.config = function()
	local has_feline, feline = pcall(require, "feline")

	if not has_feline then
		return
	end

	local vi_mode_colors = {
		NORMAL = "green2" or "green",
		OP = "green2" or "green",
		INSERT = "red1",
		VISUAL = "blue",
		BLOCK = "blue",
		REPLACE = "magenta",
		["V-REPLACE"] = "magenta",
		ENTER = "cyan",
		MORE = "cyan",
		SELECT = "orange",
		COMMAND = "green",
		SHELL = "green",
		TERM = "green",
		NONE = "yellow",
	}

	feline.setup({
		colors = require("plugins.feline.colours"),
		components = require("plugins.feline.components"),
		disable = require("plugins.feline.disable"),
		force_inactive = require("plugins.feline.force_inactive"),
		vi_mode_colors = vi_mode_colors,
	})
end

return M
