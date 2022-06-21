local fn = vim.fn
local execute = vim.api.nvim_command
local M = {}

M.install_packer = function()
  local directory = string.format("%s/site/pack/packer/start/", fn.stdpath("data"))
  fn.mkdir(directory, "p")
  local output = fn.system(
    (
    string.format(
      "git clone --depth 1 %s %s",
      "https://github.com/wbthomason/packer.nvim",
      directory .. "/packer.nvim"
    )
    )
  )
  print(output)
  print("Installing Packer")
  execute("packadd packer.nvim")
  print("Please restart NeoVim")
end

M.load_plugins = function()
  local has_packer, packer = pcall(require, "packer")
  if not has_packer then
    M.install_packer()
  end

  local config = {
    max_jobs = 10,
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  }
  packer.init(config)

  local use = require("packer").use
  packer.reset()

  -- important plugins required either for the config or other plugins to work
  use({
    "wbthomason/packer.nvim", -- A use-package inspired plugin manager for Neovim.
  })
  use({
    "rcarriga/nvim-notify",
  }) -- A fancy, configurable, notification manager for NeoVim
  use({
    "nvim-lua/plenary.nvim",
  }) -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
  use({
    "nvim-lua/popup.nvim",
  }) -- [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
  use({
    "folke/lua-dev.nvim",
  }) -- Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  use({
    "kyazdani42/nvim-web-devicons",
  }) -- lua `fork` of vim-web-devicons for neovim
  use({
    "kyazdani42/nvim-tree.lua", -- A file explorer tree for neovim written in lua
    config = require("plugins.nvimtree").config(),
    requires = "kyazdani42/nvim-web-devicons",
  })
  use({
    "folke/which-key.nvim", -- Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
  })

  -- LSP stuff
  use({
    "neovim/nvim-lspconfig", -- Quickstart configurations for the Nvim LSP client
    config = require("lsp").config(),
    requires = {
      "hrsh7th/cmp-nvim-lsp",
    },
  })
  use({
    "williamboman/nvim-lsp-installer",
    requires = "neovim/nvim-lspconfig",
  })
  use({
    "hrsh7th/nvim-cmp", -- Autocompletion plugin
    config = require("plugins.cmp").config(),
  })
  use({
    "hrsh7th/cmp-path", -- nvim-cmp source for path
  })
  use({
    "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
  })
  use({
    "hrsh7th/cmp-nvim-lua", -- nvim-cmp source for nvim lua
  })
  use({
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  })
  use({
    "hrsh7th/cmp-nvim-lsp-signature-help",
  })
  use({
    "hrsh7th/cmp-cmdline",
  })

  use({
    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
  })
  use({
    "L3MON4D3/LuaSnip", -- Snippets Plugin
    config = require("plugins.luasnip").config(),
  })
  use({
    "alaviss/nim.nvim",
  })
  use({
    "vim-crystal/vim-crystal",
  })
  use({
    "windwp/nvim-autopairs",
    config = require("plugins.autopairs").config(),
  })

  use({
    "tami5/lspsaga.nvim", -- till glepnir goes back online
    config = require("plugins.lspsaga").config(),
  })
  use({
    "jose-elias-alvarez/null-ls.nvim", -- inject LSP diagnostics, code actions, and more via Lua
  })

  use({
    "folke/trouble.nvim", -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
    requires = "kyazdani42/nvim-web-devicons",
    config = require("plugins.trouble").config(),
  })
  use({ "jose-elias-alvarez/nvim-lsp-ts-utils" }) -- Utilities to improve the TypeScript development experience for Neovim's built-in LSP client.

  -- Uncomment when first time setup, lua version does not do the auth, yet
  -- use({
  --   "github/copilot.vim",
  -- })

  use({
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  })

  use({
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
  })

  use({
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  })

  -- Debugging stuff
  use({
    "mfussenegger/nvim-dap",
    config = require("plugins.dap").config(),
  })

  use({
    "rcarriga/nvim-dap-ui",
    requires = "mfussenegger/nvim-dap",
  })

  use({
    "leoluz/nvim-dap-go",
    config = require("dap-go").setup(),
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim", -- Find, Filter, Preview, Pick. All lua, all the time.
    config = require("plugins.telescope").config(),
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim", -- FZF sorter for telescope written in c
    run = "make",
  })
  use({
    "nvim-telescope/telescope-media-files.nvim", -- Telescope extension to preview media files using Ueberzug.
  })
  use({
    "jvgrootveld/telescope-zoxide", -- An extension for telescope.nvim that allows you operate zoxide within Neovim.
  })
  use({ "nvim-telescope/telescope-ui-select.nvim" })

  use({
    "someone-stole-my-name/yaml-companion.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
  })

  use({ "LinArcX/telescope-env.nvim", requires = { { "nvim-telescope/telescope.nvim" } } })

  use({
    "nvim-telescope/telescope-dap.nvim",
  })

  -- TreeSitter
  use({
    "nvim-treesitter/nvim-treesitter", -- Nvim Treesitter configurations and abstraction layer
    config = require("plugins.treesitter").config(),
  })
  use({ "nvim-treesitter/nvim-treesitter-refactor" }) -- Refactor module for nvim-treesitter
  use({ "nvim-treesitter/nvim-treesitter-textobjects" }) -- Create your own textobjects using tree-sitter queries!
  use({ "romgrk/nvim-treesitter-context" }) -- Show code context
  use({
    "windwp/nvim-ts-autotag", -- Use treesitter to auto close and auto rename html tag
  })
  use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
  use({
    "numToStr/Comment.nvim", -- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
    config = require("plugins.comment").config(),
  })
  use({ "nvim-treesitter/playground" })
  use({ "p00f/nvim-ts-rainbow" })

  --  UI stuff
  use({
    "lewis6991/gitsigns.nvim", -- Git signs written in pure lua
    requires = { "nvim-lua/plenary.nvim" },
    config = require("plugins.gitsigns").config(),
  })
  use({
    "lukas-reineke/indent-blankline.nvim", -- Indent guides for Neovim
    config = require("plugins.indent-blankline").config(),
  })

  use({
    "noib3/nvim-cokeline",
    requires = "kyazdani42/nvim-web-devicons",
    config = require("plugins.cokeline").config(),
  })

  use({
    "feline-nvim/feline.nvim", -- A minimal, stylish and customizable statusline for Neovim written in Lua
    requires = { "kyazdani42/nvim-web-devicons" },
    config = require("plugins.feline").config(),
  })

  use({
    "norcalli/nvim-colorizer.lua",
    config = require("plugins.colorizer").config(),
  })

  use({
    "sunjon/Shade.nvim",
    config = require("plugins.shade").config(),
  })

  use({
    "beauwilliams/focus.nvim", -- Auto-Focusing and Auto-Resizing Splits/Windows for Neovim written in Lua! Vim splits on steroids.
    config = require("plugins.focus").config(),
  })

  use({
    "anuvyklack/pretty-fold.nvim", -- Foldtext customization and folded region preview in Neovim.
    config = require("plugins.pretty-fold").config(),
  })

  use({
    "folke/twilight.nvim", -- 🌅 Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
    config = require("plugins.twilight").config(),
  })

  use({
    "declancm/cinnamon.nvim", -- Smooth scrolling for ANY movement command 🤯. A Neovim plugin written in Lua!
    config = require("plugins.cinnamon").config(),
  })

  -- Neorg
  use({
    "nvim-neorg/neorg",
    config = require("plugins.neorg").config(),
    requires = { "nvim-neorg/neorg-telescope" },
  })

  -- Testing
  --[[ use({
    "rcarriga/neotest", -- An extensible framework for interacting with tests within NeoVim.
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  }) ]]

  -- Others
  use({
    "goolord/alpha-nvim", -- a lua powered greeter like vim-startify / dashboard-nvim
    config = require("plugins.alpha").config(),
  })

  use({
    "vuki656/package-info.nvim", -- See latest package versions in your package.json
    requires = { "MunifTanjim/nui.nvim" },
    config = require("plugins.package-info").config(),
  })

  use({
    "ahmedkhalf/project.nvim", -- The superior project management solution for neovim.
    config = require("plugins.project").config(),
  })

  use({
    "kevinhwang91/nvim-hlslens", -- Hlsearch Lens for Neovim
    config = require("plugins.hlslens").config(),
  })

  use({ "wakatime/vim-wakatime" }) -- Vim plugin for automatic time tracking and metrics generated from your programming activity.

  use({
    "ggandor/lightspeed.nvim", -- Next-generation motion plugin with incremental input processing, allowing for unparalleled speed with near-zero cognitive effort
    config = require("plugins.lightspeed").config(),
  })

  use({
    "danymat/neogen", -- A better annotation generator. Supports multiple languages and annotation conventions.
    config = require("plugins.neogen").config(),
  })

  use({
    "nathom/filetype.nvim", -- A faster version of filetype.vim
    config = require("plugins.filetype").config(),
  })

  use({
    "tpope/vim-projectionist", -- projectionist.vim: Granular project configuration
    config = require("plugins.projectionist").config(),
  })

  use({
    "monaqa/dial.nvim", -- enhanced increment/decrement plugin for Neovim.
    config = require("plugins.dial").config(),
  })

  use({ "dstein64/vim-startuptime" })
  use({ "lewis6991/impatient.nvim" })

  --  theme

  use({
    "rebelot/kanagawa.nvim",
    config = require("plugins.kanagawa").config(),
  })
  use({
    "rmehri01/onenord.nvim", -- 🏔️ A Neovim theme that combines the Nord and Atom One Dark color palettes for a more vibrant programming experience.
    config = require("plugins.onenord").config(),
  })

  use({
    "rose-pine/neovim",
    as = "rose-pine",
    tag = "v1.*",
    config = require("plugins.rosepine").config(),
  })

  -- Keep things up to date
  -- packer.sync()
end

return M
