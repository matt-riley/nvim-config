local M = {}

M.config = function()
	local has_package_info, pkg = pcall(require, "package-info")
	if not has_package_info then
		return
	end

	pkg.setup({
		package_manager = "npm",
	})
end

M.keymaps = {
	["<leader>n"] = {
		name = "Package Info",
		d = {
			"<cmd>lua require('package-info').delete()<cr>",
			"Delete package",
		},
		i = { "<cmd>lua require('package-info').install()<cr>", "Install package" },
		v = { "<cmd>lua require('package-info').change_version()<cr>", "Install different version" },
		s = {
			"<cmd>lua require('package-info').show()<cr>",
			"Show Package Info",
		},
		h = {
			"<cmd>lua require('package-info').hide()<cr>",
			"Hide Package Info",
		},
	},
}

return M
