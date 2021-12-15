local M = {}

M.config = function()
  local has_telescope, telescope = pcall(require, "telescope")
  if has_telescope then
    telescope.setup({
      file_sorter = require("telescope.sorters").get_fzy_sorter,
      generic_sorter = require("telescope.sorters").get_fzy_sorter,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      prompt_position = "bottom",
      prompt_prefix = "> ",
      selection_caret = "> ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_defaults = {
        horizontal = {
          mirror = false,
        },
        vertical = {
          mirror = false,
        },
      },
      file_ignore_patterns = { "node_modules" },
      shorten_path = true,
      winblend = 0,
      width = 0.75,
      preview_cutoff = 120,
      results_height = 1,
      results_width = 0.8,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").cat.new,
      grep_previewer = require("telescope.previewers").vimgrep.new,
      qflist_previewer = require("telescope.previewers").qflist.new,
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = false,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        media_files = {
          filetypes = { "png", "webp", "jpg", "jpeg", "webm", "pdf" },
          find_cmd = "rg",
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
    })

    -- Extensions
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "projects")
    pcall(require("telescope").load_extension, "zoxide")
  end
end

M.keymaps = {
  ["<leader>f"] = {
    name = "Telescope",
    b = { "<BS><cmd>Telescope buffers<cr>", "Buffers" },
    f = { "<BS><cmd>Telescope find_files<cr>", "Files" },
    g = { "<BS><cmd>Telescope live_grep<cr>", "Grep" },
    h = { "<BS><cmd>Telescope help_tags<cr>", "Help tags" },
    m = {
      ":lua require('telescope').extensions.media_files.media_files()<cr>",
      "Media files",
    },
    p = { "<BS><cmd>Telescope projects<cr>", "Projects" },
    r = { "<BS><cmd>Telescope oldfiles<cr>", "Recent Files" },
    z = { ":lua require('telescope').extensions.zoxide.list{}<cr>", "Z" },
  },
}

return M
