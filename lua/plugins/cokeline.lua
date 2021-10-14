local M = {}

M.config = function()
	local has_coke, cokeline = pcall(require, "cokeline")
	if not has_coke then
		return
	end
	local get_hex = require("cokeline/utils").get_hex
	cokeline.setup({
		hide_when_one_buffer = false,
		default_hl = {
			focused = {
				fg = get_hex("Normal", "fg"),
				bg = "NONE",
			},
			unfocused = {
				fg = "#737aa2",
				bg = "NONE",
			},
		},
	})
end

return M
