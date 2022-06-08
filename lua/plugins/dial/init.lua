local M = {}

M.config = function()
  local has_dial = pcall(require, "dial")
  if not has_dial then
    return
  end

  local config = require("dial.config")
  local augend = require("dial.augend")

  config.augends:register_group({
    default = {
      augend.integer.alias.decimal_int,
      augend.integer.alias.hex,
      augend.date.alias["%Y/%m/%d"],
      augend.date.alias["%d/%m/%Y"],
      augend.date.alias["%m/%d"],
      augend.date.alias["%d/%m"],
      augend.date.alias["%H:%M"],
      augend.constant.alias.bool,
    },
  })
  -- Keymaps - We add repeat support to this
  vim.keymap("n", "<C-a>", "<Plug>(dial-increment)", { silent = true })
  vim.keymap("n", "<C-x>", "<Plug>(dial-decrement)", { silent = true })

  vim.keymap("v", "<C-a>", "<Plug>(dial-increment)", { silent = true })
  vim.keymap("v", "<C-x>", "<Plug>(dial-decrement)", { silent = true })

  vim.keymap("v", "g<C-a>", "<Plug>(dial-increment-additional)", { silent = true })
  vim.keymap("v", "g<C-x>", "<Plug>(dial-decrement-additional)", { silent = true })
end

M.keymaps = {}
return M
