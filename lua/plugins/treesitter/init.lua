local M = {}

M.config = function()
  local has_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")
  if not has_treesitter then
    return
  end

  require("plugins.treesitter.org_parser").create_parser()

  treesitter.setup({
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
    autotag = {
      enable = true,
      filetypes = {
        "html",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "astro",
        "markdown",
      },
    },

    context_commentstring = { enable = true },

    ensure_installed = "maintained", -- one of 'all', 'language', or a list of languages

    highlight = {
      enable = true, -- false will disable the whole extension
      additional_vim_regex_highlighting = { "org" },
    },

    incremental_selection = {
      enable = true,
      keymaps = { -- mappings for incremental selection (visual mappings)
        init_selection = "gnn", -- maps in normal mode to init the node/scope selection
        node_incremental = "grn", -- increment to the upper named parent
        scope_incremental = "gns", -- increment to the upper scope (as defined in locals.scm)
        node_decremental = "grm", -- decrement to the previous node
      },
    },

    indent = { enable = true },

    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = true },
      smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "gnd",
          list_definitions = "gnD",
          list_definitions_toc = "gO",
          goto_next_usage = "<a-*>",
          goto_previous_usage = "<a-#>",
        },
      },
    },

    --[[ tree_docs = {
      enable = true,
    }, ]]
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      lsp_interop = {
        enable = true,
        peek_definition_code = {
          ["df"] = "@function.outer",
          ["dF"] = "@class.outer",
        },
      },
    },
  })
end

return M
