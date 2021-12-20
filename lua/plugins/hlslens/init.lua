local M = {}

M.config = function()
	local has_hlslens, hlslens = pcall(require, "hlslens")
	if not has_hlslens then
		return
	end

	hlslens.setup({
		calm_down = true,
		nearest_only = true,
	})
end

M.keymaps = {
	n = {
		"<Cmd>execute('normal! ' . v:count1 . 'n')<CR>\\<Cmd>lua require('hlslens').start()<CR>",
	},
	N = {
		"<Cmd>execute('normal! ' . v:count1 . 'N')<CR>\\<Cmd>lua require('hlslens').start()<CR>",
	},
	["*"] = {
		"<Cmd>lua require('hlslens').start()<CR>",
	},
	["#"] = {
		"<Cmd>lua require('hlslens').start()<CR>",
	},
	["g*"] = {
		"<Cmd>lua require('hlslens').start()<CR>",
	},
	["g#"] = {
		"<Cmd>lua require('hlslens').start()<CR>",
	},
	["<leader>l"] = {
		":noh",
	},
}

return M
