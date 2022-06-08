local M = {}

M.config = function()
  local has_nvim_tree, nvim_tree = pcall(require, "nvim-tree")
  if not has_nvim_tree then
    return
  end

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
    ignore_ft_on_setup = { "alpha", "startify", "dashboard" },
    open_on_setup = false,
    renderer = {
      highlight_git = true,
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
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
        },
      },
      root_folder_modifier = ":t",
    },
    respect_buf_cwd = true,
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
