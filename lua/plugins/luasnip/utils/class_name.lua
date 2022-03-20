local caps = require("plugins.luasnip.utils.capitalise")

local class_name = function()
  local curr_buffer_name = vim.api.nvim_buf_get_name(0)
  local path_parts = vim.split(curr_buffer_name, "/", true)
  local file_parts = vim.split(path_parts[#path_parts], ".", true)
  return caps(file_parts[1]) .. caps(file_parts[2])
end

return class_name
