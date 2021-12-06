local api = vim.api
-- https://github.com/norcalli/nvim_utils/blob/71919c2f05920ed2f9718b4c2e30f8dd5f167194/lua/nvim_utils.lua#L554-L567
local function create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command("augroup " .. group_name)
    api.nvim_command("autocmd!")
    for _, def in ipairs(definition) do
      -- if type(def) == 'table' and type(def[#def]) == 'function' then
      -- 	def[#def] = lua_callback(def[#def])
      -- end
      local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
      api.nvim_command(command)
    end
    api.nvim_command("augroup END")
  end
end

return create_augroups
