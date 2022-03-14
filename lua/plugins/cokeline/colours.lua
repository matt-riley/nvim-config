local get_hex = require("cokeline/utils").get_hex

local M = {}

M.errors_fg = get_hex("DiagnosticError", "fg")
M.warnings_fg = get_hex("DiagnosticWarn", "fg")
M.green = get_hex("String", "fg")
M.normal_fg = get_hex("Normal", "fg")
M.normal_bg = get_hex("Normal", "bg")
M.column_bg = get_hex("ColourColumn", "bg")
M.comment_fg = get_hex("Comment", "fg")

return M
