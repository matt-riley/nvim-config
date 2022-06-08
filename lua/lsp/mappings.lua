local lsp_mappings = {
  ["<leader>"] = {
    c = {
      name = "LSP - Code",
      a = {
        "<cmd>Lspsaga code_action<CR>",
        "Code Action",
      },
      c = {
        "<cmd>Lspsaga show_cursor_diagnostics<CR>",
        "Cursor Diagnostics",
      },
      l = {
        "<cmd>Lspsaga show_line_diagnostics<CR>",
        "Line Diagnostics",
      },
    },
    e = { ":NvimTreeToggle<CR>", "Toggle Nvim-Tree" },
    f = {
      name = "Telescope",
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      d = {
        "<cmd>Telescope zoxide list<cr>",
        "Directories",
      },
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
      h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
      m = {
        ":lua require('telescope').extensions.media_files.media_files()<cr>",
        "Media files",
      },
    },
    r = { n = { "<cmd>Lspsaga rename<CR>", "Rename" } },
  },
  K = {
    "<cmd>Lspsaga hover_doc<CR>",
    "Hover Docs",
  },
  ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
  ["gh"] = {
    "<cmd>Lspsaga lsp_finder<CR>",
    "References",
  },
  ["gs"] = {
    "<cmd>Lspsaga signature_help<CR>",
    "Signature",
  },
  ["[e"] = {
    "<cmd>Lspsaga diagnostic_jump_prev<CR>",
    "Previous Diagnostics",
  },
  ["]e"] = {
    "<cmd>Lspsaga diagnostic_jump_next<CR>",
    "Next Diagnostics",
  },
}

return lsp_mappings
