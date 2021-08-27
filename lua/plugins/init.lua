local fn = vim.fn
local execute = vim.api.nvim_command

local M = {}

M.install_packer = function()
	local directory = string.format("%s/site/pack/packer/start/", fn.stdpath("data"))
	fn.mkdir(directory, "p")
	local output = fn.system(
		(string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim"))
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

	local has_notify = pcall(require, "notify")
	if has_notify then
		local config = {
			display = {
				non_interactive = true,
			},
		}
		packer.init(config)
	else
		packer.init()
	end

	local use = require("plugins.utils").use
	packer.reset()

	-- important plugins required either for the config or other plugins to work
	use("wbthomason/packer.nvim") -- A use-package inspired plugin manager for Neovim.
	use("rcarriga/nvim-notify") -- A fancy, configurable, notification manager for NeoVim
	use("nvim-lua/plenary.nvim") -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
	use("nvim-lua/popup.nvim") -- [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
	use("folke/lua-dev.nvim") -- Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
	use("kyazdani42/nvim-web-devicons") -- lua `fork` of vim-web-devicons for neovim
	use({
		"kyazdani42/nvim-tree.lua", -- A file explorer tree for neovim written in lua
		config = require("plugins.nvimtree").config(),
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("folke/which-key.nvim") -- Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.

	-- LSP stuff
	use({
		"neovim/nvim-lspconfig", -- Quickstart configurations for the Nvim LSP client
	})
	use({
		"kabouzeid/nvim-lspinstall", -- Install LSP Servers
		requires = "neovim/nvim-lspconfig",
	})
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use({
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		requires = "hrsh7th/nvim-cmp",
	})
	use({
		"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
		requires = "L3MON4D3/LuaSnip",
	})
	use("L3MON4D3/LuaSnip") -- Snippets Plugin
	--	use({
	--		"tzachar/cmp-tabnine", -- TabNine plugin for hrsh7th/nvim-cmp
	--		requires = "hrsh7th/nvim-cmp",
	--		run = "./install.sh",
	--	})

	use("onsails/lspkind-nvim") -- vscode-like pictograms for neovim lsp completion items

	use("glepnir/lspsaga.nvim") -- A light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
	use("jose-elias-alvarez/null-ls.nvim") -- inject LSP diagnostics, code actions, and more via Lua
	use("ray-x/lsp_signature.nvim") -- lsp signature hint when you type
	use({
		"folke/trouble.nvim", -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
		requires = "kyazdani42/nvim-web-devicons",
		config = require("plugins.trouble").config(),
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim", -- Find, Filter, Preview, Pick. All lua, all the time.
		config = require("plugins.telescope").config(),
	})
	use({
		"nvim-telescope/telescope-fzy-native.nvim", -- FZY style sorter that is compiled_loader
	})
	use({
		"nvim-telescope/telescope-media-files.nvim", -- Telescope extension to preview media files using Ueberzug.
	})
	use({
		"jvgrootveld/telescope-zoxide", -- An extension for telescope.nvim that allows you operate zoxide within Neovim.
	})

	-- TreeSitter
	use({
		"nvim-treesitter/nvim-treesitter", -- Nvim Treesitter configurations and abstraction layer
		branch = "0.5-compat",
		run = ":TSUpdate",
		config = require("plugins.treesitter").config(),
	})
	use({ "nvim-treesitter/nvim-treesitter-refactor" }) -- Refactor module for nvim-treesitter
	use({ "nvim-treesitter/nvim-treesitter-textobjects", branch = "0.5-compat" }) -- Create your own textobjects using tree-sitter queries!
	use({ "romgrk/nvim-treesitter-context" }) -- Show code context
	use({ "windwp/nvim-ts-autotag" }) -- Use treesitter to auto close and auto rename html tag
	use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
	use({ "tpope/vim-commentary" }) -- commentary.vim: comment stuff out

	--  UI stuff
	use({
		"lewis6991/gitsigns.nvim", -- Git signs written in pure lua
		requires = { "nvim-lua/plenary" },
		config = require("plugins.gitsigns").config(),
	})
	use({
		"lukas-reineke/indent-blankline.nvim", -- Indent guides for Neovim
		config = require("plugins.indent-blankline").config(),
	})
	use({
		"akinsho/nvim-bufferline.lua", -- A snazzy bufferline for Neovim
		requires = "kyazdani42/nvim-web-devicons",
		config = require("plugins.bufferline").config(),
	})
	use({
		"hoob3rt/lualine.nvim", -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = require("plugins.lualine").config(),
	})

	-- Others
	use({
		"glepnir/dashboard-nvim", -- vim dashboard
		config = require("plugins.dashboard").config(),
	})

	use({
		"vuki656/package-info.nvim", -- See latest package versions in your package.json
		config = require("plugins.package-info").config(),
	})

	use({
		"ahmedkhalf/project.nvim", -- The superior project management solution for neovim.
		config = require("plugins.project").config(),
	})

	use({
		"jghauser/mkdir.nvim", -- This neovim plugin creates missing folders on save.
	})

	-- WakaTime
	use({ "wakatime/vim-wakatime" }) -- Vim plugin for automatic time tracking and metrics generated from your programming activity.

	--  theme
	use({
		"folke/tokyonight.nvim", -- A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins.
		config = require("plugins.tokyonight").config(),
	})

	-- Keep things up to date
	execute("PackerSync")
end

return M
