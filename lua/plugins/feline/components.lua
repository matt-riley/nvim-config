local lsp = require("feline.providers.lsp")
local vi_mode = require("feline.providers.vi_mode")

local components = {
	active = { {}, {}, {} },
	inactive = {},
}

components.active[1][1] = {
	provider = "█",
	hl = function()
		return {
			fg = vi_mode.get_mode_color(),
		}
	end,
	right_sep = " ",
}

components.active[1][2] = {
	provider = function()
		return vi_mode.get_vim_mode()
	end,
	hl = function()
		return {
			fg = vi_mode.get_mode_color(),
			style = "bold",
		}
	end,
	right_sep = " ",
}

components.active[1][3] = {
	provider = "git_branch",
	hl = function()
		return {
			fg = "purple",
		}
	end,
}

components.active[1][4] = {
	provider = "git_diff_added",
	hl = {
		fg = "green",
	},
}

components.active[1][5] = {
	provider = "git_diff_changed",
	hl = {
		fg = "orange",
	},
}
components.active[1][6] = {
	provider = "git_diff_removed",
	hl = {
		fg = "red",
	},
	right_sep = {
		str = " ",
		hl = {
			fg = "NONE",
		},
	},
}

components.active[2][1] = {
	provider = "lsp_client_names",
	hl = {
		fg = "yellow",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}

components.active[2][2] = {
	provider = "diagnostic_errors",
	enabled = function()
		return lsp.diagnostics_exist("Error")
	end,
	hl = {
		fg = "red",
		style = "bold",
	},
}
-- diagnosticWarn
components.active[2][3] = {
	provider = "diagnostic_warnings",
	enabled = function()
		return lsp.diagnostics_exist("Warning")
	end,
	hl = {
		fg = "yellow",
		style = "bold",
	},
}
-- diagnosticHint
components.active[2][4] = {
	provider = "diagnostic_hints",
	enabled = function()
		return lsp.diagnostics_exist("Hint")
	end,
	hl = {
		fg = "cyan",
		style = "bold",
	},
}
-- diagnosticInfo
components.active[2][5] = {
	provider = "diagnostic_info",
	enabled = function()
		return lsp.diagnostics_exist("Information")
	end,
	hl = {
		fg = "skyblue",
		style = "bold",
	},
}

return components
