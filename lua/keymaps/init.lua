local M = {}
local has_wk, wk = pcall(require, "which-key")

M.defaults = function()
  local g = vim.g
  local api = vim.api
  local nvim_keymap = api.nvim_set_keymap
  local opt = { noremap = true, silent = true }
  g.mapleader = " "

  -- Turn off hlsearch
  nvim_keymap("n", "<leader>,", ":nohl<cr>", opt)

  if has_wk then
    wk.setup()
    local wk_mappings = require("keymaps.mappings")
    wk.register(wk_mappings, opt)
  else
    -- NvimTree
    nvim_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opt)
  end
end

return M
