local vi_mode = require("feline.providers.vi_mode")
local colours = require("plugins.feline.colours").theme
local main_text = colours.black or colours.gray
local components = {
  active = { {}, {}, {} },
  inactive = {},
}

components.active[1][1] = {
  provider = "  ",
  hl = function()
    return {
      fg = colours.orange,
      style = "bold",
    }
  end,
  left_sep = " ",
  right_sep = "",
}
components.active[1][2] = {
  provider = function()
    local mode = vi_mode.get_vim_mode():lower()
    return mode:sub(1, 1):upper() .. mode:sub(2)
  end,
  hl = function()
    return {
      fg = main_text,
      bg = vi_mode.get_mode_color(),
      style = "bold",
    }
  end,
  left_sep = " ",
  right_sep = "",
}

components.active[1][3] = {
  provider = "file_info",
  hl = {
    fg = main_text,
    style = "bold",
    bg = colours.yellow,
  },
  left_sep = " ",
  right_sep = "",
}

components.active[2][1] = {
  provider = "lsp_client_names",
  hl = {
    fg = colours.black or colours.fg,
    style = "bold",
    bg = colours.skyblue or colours.dark_blue,
  },
  icon = {
    str = "   ",
    hl = {
      fg = colours.black or colours.fg,
    },
  },
  left_sep = "",
  right_sep = "",
}

components.active[3][1] = {
  provider = "diagnostic_errors",
  hl = {
    bg = colours.red,
    style = "bold",
    fg = main_text,
  },
  left_sep = "",
  right_sep = " ",
}

-- diagnosticWarn
components.active[3][2] = {
  provider = "diagnostic_warnings",
  hl = {
    bg = colours.yellow,
    style = "bold",
    fg = main_text,
  },
  left_sep = "",
  right_sep = " ",
}
-- diagnosticHint
components.active[3][3] = {
  provider = "diagnostic_hints",
  hl = {
    bg = colours.cyan,
    style = "bold",
    fg = main_text,
  },
  left_sep = "",
  right_sep = " ",
}
-- diagnosticInfo
components.active[3][4] = {
  provider = "diagnostic_info",
  hl = {
    bg = colours.skyblue,
    style = "bold",
    fg = main_text,
  },
  left_sep = "",
  right_sep = " ",
}

components.active[3][5] = {
  provider = "git_branch",
  hl = {
    bg = colours.green,
    style = "bold",
    fg = main_text,
  },
  icon = " ",
  left_sep = "",
  right_sep = " ",
}

components.active[3][6] = {
  provider = "git_diff_added",
  hl = {
    bg = colours.green,
    style = "bold",
    fg = main_text,
  },
  left_sep = "",
  right_sep = " ",
}

components.active[3][7] = {
  provider = "git_diff_changed",
  hl = {
    bg = colours.orange,
    style = "bold",
    fg = main_text,
  },
  left_sep = "",
  right_sep = " ",
}
components.active[3][8] = {
  provider = "git_diff_removed",
  hl = {
    bg = colours.red,
    style = "bold",
    fg = main_text,
  },
  left_sep = "",
  right_sep = " ",
}

--[[ components.active[3][9] = {
  provider = "position",
  hl = {
    fg = main_text,
    bg = colours.purple,
    style = "bold",
  },
  left_sep = "",
  right_sep = " ",
} ]]

return components
