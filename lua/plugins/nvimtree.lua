local M = {}

M.config = function()
	local g = vim.g

	g.loaded_netrw = 1
	g.loaded_netrwPlugin = 1

	g.nvim_tree_auto_close = 1
	g.nvim_tree_auto_ignore_ft = { "alpha", "startify", "dashboard" }
	g.nvim_tree_auto_open = 1
	g.nvim_tree_disable_window_picker = 1
	g.nvim_tree_follow = 1
	g.nvim_tree_git_hl = 1
	g.nvim_tree_ignore = { ".git" }
	g.nvim_tree_indent_markers = 1
	g.nvim_tree_lsp_diagnostics = 1
	g.nvim_tree_quit_on_open = 1
	g.nvim_tree_root_folder_modifier = ":t"
	g.nvim_tree_side = "right"
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
		lsp = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	}
end

M.keymaps = {
	["<leader>e"] = {
		":NvimTreeToggle<CR>",
		"NvimTree Toggle",
	},
}

return M
