local M = {}

M.config = function()
  local has_nvim_tree, nvim_tree = pcall(require, "nvim-tree")
  if not has_nvim_tree then
    return
  end
  local g = vim.g

  g.nvim_tree_git_hl = 1
  g.nvim_tree_respect_buf_cwd = 1
  -- g.nvim_tree_indent_markers = 1
  g.nvim_tree_root_folder_modifier = ":t"
  g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
  }
  g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌",
    },
    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    },
  }

  nvim_tree.setup({
    actions = {
      open_file = {
        quit_on_open = true,
        window_picker = {
          enable = true,
        },
      },
    },
    disable_netrw = true,
    diagnostics = {
      enable = true,
      icons = { hint = "", info = "", warning = "", error = "" },
    },
    -- filters = { custom = { ".git" } },
    ignore_ft_on_setup = { "alpha", "startify", "dashboard" },
    open_on_setup = false,
    renderer = {
      indent_markers = {
        enable = true,
      },
    },
    update_cwd = true,
    update_focused_file = { enable = true, update_cwd = true },
    view = { side = "right", width = 30 },
  })
end

M.keymaps = {
  ["<leader>e"] = {
    ":NvimTreeToggle<CR>",
    "NvimTree Toggle",
  },
}

return M
