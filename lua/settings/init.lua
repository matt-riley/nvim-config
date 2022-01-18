local opt = vim.opt
local cmd = vim.cmd

local data_dir = vim.fn.stdpath("data")

local M = {}

M.defaults = function()
  local has_keymaps, keymaps = pcall(require, "keymaps")

  if has_keymaps then
    keymaps.defaults()
  end

  cmd("filetype plugin on")

  local globals = {
    background = "dark",
    backspace = "indent,eol,start",
    backup = true,
    backupcopy = "auto",
    backupdir = data_dir .. "/backups",
    breakindent = true,
    clipboard = "unnamedplus",
    completeopt = "menu,menuone,noselect",
    cursorline = true,
    encoding = "UTF-8",
    expandtab = true,
    foldlevel = 5,
    foldexpr = "nvim_treesitter#foldexpr()",
    foldmethod = "expr",
    hidden = true,
    history = 10000,
    lazyredraw = true,
    magic = true,
    mouse = "a",
    number = true,
    relativenumber = true,
    scrolloff = 8,
    sessionoptions = "folds",
    shiftwidth = 2,
    showmatch = true,
    signcolumn = "yes",
    softtabstop = 2,
    splitbelow = true,
    splitright = true,
    tabstop = 2,
    termguicolors = true,
    title = true,
    undofile = true,
    undodir = data_dir .. "/undo",
    updatetime = 4000,
    viewoptions = "folds,cursor",
    visualbell = true,
    wildmenu = true,
    writebackup = true,
  }

  for name, value in pairs(globals) do
    opt[name] = value
  end

  vim.opt_global.shortmess:remove("F") -- NOTE: Without doing this, autocommands that deal with filetypes prohibit messages from being shown

  --  Return to the same position in the file when reopening
  cmd([[
    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 
    ]])

  local keymap = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }
  keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
  keymap("v", "K", "m '<-2<CR>gv=gv", opts)
end

return M
