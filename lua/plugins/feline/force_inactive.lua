local defaults = require("feline.defaults").force_inactive

local buftypes = {}
local bufnames = {}
local filetypes = {}

local M = {}
M.bufnames = vim.tbl_deep_extend("force", defaults.bufnames, bufnames)
M.buftypes = vim.tbl_deep_extend("force", defaults.buftypes, buftypes)
M.filetypes = vim.tbl_deep_extend("force", defaults.filetypes, filetypes)

return M
