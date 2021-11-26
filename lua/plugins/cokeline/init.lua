local M = {}

M.config = function()
	local has_coke, cokeline = pcall(require, "cokeline")
	if not has_coke then
		return
	end

	local get_hex = require("cokeline/utils").get_hex

	cokeline.setup({
		default_hl = {
			focused = {
				fg = get_hex("Normal", "fg"),
				bg = "NONE",
				style = "bold",
			},
			unfocused = {
				fg = get_hex("Comment", "fg"),
				bg = "NONE",
			},
		},
		components = {
			{
				text = function(buffer)
					return (buffer.index ~= 1) and "▏" or ""
				end,
				hl = {
					fg = get_hex("Normal", "fg"),
				},
			},
			{
				text = function(buffer)
					return "    " .. buffer.devicon.icon
				end,
				hl = {
					fg = function(buffer)
						return buffer.devicon.color
					end,
				},
			},
			{
				text = function(buffer)
					if buffer.is_focused then
						return buffer.filename .. "    "
					else
						return buffer.unique_prefix .. buffer.filename .. "    "
					end
				end,
				hl = {
					style = function(buffer)
						return buffer.is_focused and "bold" or nil
					end,
				},
			},
			{
				text = "",
				delete_buffer_on_left_click = true,
			},
			{
				text = "  ",
			},
		},
	})
end

return M
