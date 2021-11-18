local M = {}

M.config = function()
	local has_luasnip, luasnip = pcall(require, "luasnip")
	if not has_luasnip then
		return
	end

	luasnip.loaders.from_vscode.lazy_load()
end
return M
