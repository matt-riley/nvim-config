local M = {}

M.config = function()
	local g = vim.g

	g.loaded_netrw = 1
	g.loaded_netrwPlugin = 1

	g.nvim_tree_auto_open = 0
	g.nvim_tree_auto_close = 1
	g.nvim_tree_quit_on_open = 1
	g.nvim_tree_side = "right"
	g.nvim_tree_follow = 1
	g.nvim_tree_indent_markers = 1
	g.nvim_tree_git_hl = 1
	g.nvim_tree_root_folder_modifier = ":t"
	g.nvim_tree_lsp_diagnostics = 1
	g.nvim_tree_auto_ignore_ft = { "startify", "dashboard" }
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
			unstaged = "",
			staged = "S",
			unmerged = "",
			renamed = "➜",
			deleted = "",
			untracked = "U",
			ignored = "◌",
		},
		folder = {
			default = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
		},
	}
end

local view = require("nvim-tree.view")

M.toggle_tree = function()
	if view.win_open() then
		require("nvim-tree").close()
		if package.loaded["bufferline.state"] then
			require("bufferline.state").set_offset(0)
		end
	else
		if package.loaded["bufferline.state"] then
			require("bufferline.state").set_offset(31, "File Explorer")
		end
		require("nvim-tree").find_file(true)
	end
end

M.keymaps = {
	["<leader>e"] = {
		":lua require('plugins.nvimtree').toggle_tree()<CR>",
		"NvimTree Toggle",
	},
}

return M
