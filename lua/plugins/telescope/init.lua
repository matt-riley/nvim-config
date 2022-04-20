local M = {}

M.config = function()
  local has_telescope, telescope = pcall(require, "telescope")
  if not has_telescope then
    return
  end
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = require("telescope.actions").close,
        },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = " ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      shorten_path = true,
    },
    pickers = {
      oldfiles = {
        theme = "dropdown",
      },
    },
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
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
  })

  -- Extensions
  pcall(require("telescope").load_extension, "fzf")
  pcall(require("telescope").load_extension, "projects")
  pcall(require("telescope").load_extension, "zoxide")
  pcall(require("telescope").load_extension, "ui-select")
  pcall(require("telescope").load_extension, "command_center")
end

M.reload = function()
  local function get_module_name(s)
    local module_name = s:gsub("%.lua", "")
    module_name = module_name:gsub("%./", ".")
    module_name = module_name:gsub("%.init", "")
    return module_name
  end

  local prompt_title = "Neovim Modules"
  local path = "~/.config/nvim/lua"
  local opts = {
    prompt_title = prompt_title,
    cwd = path,
    attach_mappings = function(_, map)
      map("i", "<c-r>", function(_)
        local entry = require("telescope.actions.state").get_selected_entry()
        local name = get_module_name(entry.value)
        print(vim.inspect(name))
        R(name)
        vim.notify("RELOADED", "info", { title = name })
      end)
      return true
    end,
  }
  require("telescope.builtin").git_files(opts)
end

M.keymaps = {
  ["<leader>f"] = {
    name = "Telescope",
    b = { "<BS><cmd>Telescope buffers<cr>", "Buffers" },
    c = { '<BS><cmd>:lua require("plugins.telescope").reload()<cr>', "Config Files" },
    f = { "<BS><cmd>Telescope find_files<cr>", "Files" },
    g = { "<BS><cmd>Telescope live_grep<cr>", "Grep" },
    h = { "<BS><cmd>Telescope help_tags<cr>", "Help tags" },
    m = {
      ":lua require('telescope').extensions.media_files.media_files()<cr>",
      "Media files",
    },
    p = { "<BS><cmd>Telescope projects<cr>", "Projects" },
    r = {
      '<BS><cmd>lua require("plugins.telescope.themes.simple_drop").oldfiles()<cr>',
      "Recent Files",
    },
    z = { ":lua require('telescope').extensions.zoxide.list{}<cr>", "Z" },
  },
}

return M
