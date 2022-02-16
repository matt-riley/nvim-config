local M = {}

M.config = function()
  local has_twilight, twilight = pcall(require, "twilight")

  if not has_twilight then
    return
  end

  twilight.setup()
end

M.keymaps = {
  ["<leader>i"] = {
    ":Twilight<CR>",
    "Twilight Toggle",
  },
}

return M
