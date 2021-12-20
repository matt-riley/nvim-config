local colours = require("plugins.cokeline.colours")
local is_picking_focus = require("cokeline/mappings").is_picking_focus
local is_picking_close = require("cokeline/mappings").is_picking_close

local components = {
  close_or_unsaved = {
    text = function(buffer)
      return buffer.is_modified and "●" or ""
    end,
    hl = {
      fg = function(buffer)
        return buffer.is_modified and colours.green or nil
      end,
    },
    delete_buffer_on_left_click = true,
    truncation = { priority = 5 },
  },
  devicon = {
    text = function(buffer)
      return (is_picking_focus() or is_picking_close())
          and buffer.pick_letter .. " "
        or buffer.devicon.icon
    end,
    hl = {
      fg = function(buffer)
        return buffer.devicon.color
      end,
    },
  },
  diagnostics = {
    text = function(buffer)
      return (
          buffer.diagnostics.errors ~= 0
          and "  " .. buffer.diagnostics.errors
        )
        or (buffer.diagnostics.warnings ~= 0 and "  " .. buffer.diagnostics.warnings)
        or ""
    end,
    hl = {
      fg = function(buffer)
        return (buffer.diagnostics.errors ~= 0 and colours.errors_fg)
          or (buffer.diagnostics.warnings ~= 0 and colours.warnings_fg)
          or nil
      end,
    },
    truncation = { priority = 2 },
  },
  double_space = {
    text = "  ",
  },
  filename = {
    text = function(buffer)
      return buffer.filename
    end,
    hl = {
      fg = function(buffer)
        return (buffer.diagnostics.errors ~= 0 and colours.errors_fg)
          or (buffer.diagnostics.warnings ~= 0 and colours.warnings_fg)
          or nil
      end,
      style = function(buffer)
        return (
            (buffer.is_focused and buffer.diagnostics.errors ~= 0)
            and "bold,italic"
          )
          or (buffer.is_focused and "bold")
          or (buffer.diagnostics.errors ~= 0 and "underline")
          or nil
      end,
    },
    truncation = {
      priority = 6,
      direction = "left",
    },
  },
  separator = {
    text = function(buffer)
      return (buffer.index ~= 1) and "▏" or ""
    end,
  },
  space = {
    text = " ",
  },
  unique_prefix = {
    text = function(buffer)
      return buffer.unique_prefix
    end,
    hl = {
      fg = colours.comment_fg,
      style = "italic",
    },
    truncation = {
      priority = 7,
      direction = "left",
    },
  },
}

return components
