local M = {}

M.config = function()
  local has_dial, dial = pcall(require, "dial")
  if not has_dial then
    return
  end

  -- Boolean flipping
  dial.augends["custom#boolean"] = dial.common.enum_cyclic({
    name = "boolean",
    desc = "Flip a boolean between true and false",
    strlist = { "true", "false" },
  })
  table.insert(dial.config.searchlist.normal, "custom#boolean")

  -- Keymaps - We add repeat support to this
  vim.api.nvim_set_keymap(
    "n",
    "<C-a>",
    "<Plug>(dial-increment)",
    { silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<C-x>",
    "<Plug>(dial-decrement)",
    { silent = true }
  )

  vim.api.nvim_set_keymap(
    "v",
    "<C-a>",
    "<Plug>(dial-increment)",
    { silent = true }
  )
  vim.api.nvim_set_keymap(
    "v",
    "<C-x>",
    "<Plug>(dial-decrement)",
    { silent = true }
  )

  vim.api.nvim_set_keymap(
    "v",
    "g<C-a>",
    "<Plug>(dial-increment-additional)",
    { silent = true }
  )
  vim.api.nvim_set_keymap(
    "v",
    "g<C-x>",
    "<Plug>(dial-decrement-additional)",
    { silent = true }
  )
end

M.keymaps = {}
return M
