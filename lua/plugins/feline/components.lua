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
			style = "bold",
		}
	end,
	right_sep = {
		str = "",
		hl = function()
			return {
				fg = vi_mode.get_mode_color(),
			}
		end,
	},
}

components.active[1][2] = {
	provider = "  ",
	hl = function()
		return {
			fg = "orange",
			style = "bold",
		}
	end,
}
components.active[1][3] = {
	provider = function()
		local mode = vi_mode.get_vim_mode():lower()
		return mode:sub(1, 1):upper() .. mode:sub(2)
	end,
	hl = function()
		return {
			fg = "bg",
			bg = vi_mode.get_mode_color(),
			style = "bold",
		}
	end,
	left_sep = "█",
	right_sep = "█",
}

components.active[1][4] = {
	provider = "file_info",
	hl = {
		fg = "fg_dark",
		style = "bold",
	},
	right_sep = {
		str = "",
		hl = {
			fg = "fg_dark",
		},
	},
	left_sep = {
		str = " ",
		hl = {
			fg = "NONE",
		},
	},
}

components.active[2][1] = {
	provider = "",
	hl = function()
		return {
			fg = vi_mode.get_mode_color(),
		}
	end,
	left_sep = {
		str = "",
		hl = {
			fg = "blue",
		},
	},
}

components.active[2][2] = {
	provider = "lsp_client_names",
	hl = {
		fg = "blue",
		style = "bold",
	},
	icon = {
		str = "  ",
		hl = {
			fg = "fg",
		},
	},
	left_sep = {
		str = "",
		hl = {
			fg = "blue",
		},
	},

	right_sep = {
		str = " ",
		hl = {
			fg = "blue",
		},
	},
}

components.active[2][3] = {
	provider = "",
	hl = function()
		return {
			fg = vi_mode.get_mode_color(),
		}
	end,
	right_sep = {
		str = "",
		hl = {
			fg = "blue",
		},
	},
}

components.active[3][1] = {
	provider = "diagnostic_errors",
	hl = {
		fg = "red",
		style = "bold",
	},
	left_sep = {
		str = "",
		hl = {
			fg = "red",
		},
	},
	right_sep = {
		str = " ",
		hl = {
			fg = "NONE",
		},
	},
}

-- diagnosticWarn
components.active[3][2] = {
	provider = "diagnostic_warnings",
	hl = {
		fg = "yellow",
		style = "bold",
	},
	left_sep = {
		str = "",
		hl = {
			fg = "yellow",
		},
	},
	right_sep = {
		str = " ",
		hl = {
			fg = "NONE",
		},
	},
}
-- diagnosticHint
components.active[3][3] = {
	provider = "diagnostic_hints",
	hl = {
		fg = "cyan",
		style = "bold",
	},
	left_sep = {
		str = "",
		hl = {
			fg = "cyan",
		},
	},
	right_sep = {
		str = " ",
		hl = {
			fg = "NONE",
		},
	},
}
-- diagnosticInfo
components.active[3][4] = {
	provider = "diagnostic_info",
	hl = {
		fg = "skyblue",
		style = "bold",
	},
	left_sep = {
		str = "",
		hl = {
			fg = "skyblue",
		},
	},
	right_sep = {
		str = " ",
		hl = {
			fg = "NONE",
		},
	},
}

components.active[3][5] = {
	provider = "git_branch",
	hl = {
		fg = "green",
		style = "bold",
	},
	icon = "  ",
	left_sep = {
		str = "",
		hl = {
			fg = "green",
		},
	},
	right_sep = {
		str = " ",
		hl = {
			fg = "NONE",
		},
	},
}

components.active[3][6] = {
	provider = "git_diff_added",
	hl = {
		fg = "green",
		style = "bold",
	},
	left_sep = {
		str = "",
		hl = {
			fg = "green",
		},
	},
	right_sep = {
		str = " ",
		hl = {
			fg = "NONE",
		},
	},
}

components.active[3][7] = {
	provider = "git_diff_changed",
	hl = {
		fg = "orange",
		style = "bold",
	},
	right_sep = {
		str = " ",
		hl = {
			fg = "NONE",
		},
	},

	left_sep = {
		str = "",
		hl = {
			fg = "orange",
		},
	},
}
components.active[3][8] = {
	provider = "git_diff_removed",
	hl = {
		fg = "red",
		style = "bold",
	},
	right_sep = {
		str = " ",
		hl = {
			fg = "NONE",
		},
	},
	left_sep = {
		str = "",
		hl = {
			fg = "red",
		},
	},
}

components.active[3][9] = {
	provider = "position",
	hl = {
		fg = "bg",
		bg = "purple",
		style = "bold",
	},
	right_sep = {
		str = "█",
		hl = {
			fg = "purple",
		},
	},
	left_sep = {
		str = "█",
		hl = {
			fg = "purple",
		},
	},
}

return components
