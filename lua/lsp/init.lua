local M = {}

M.config = function()
	local lsp = vim.lsp

	lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		signs = true,
		virtual_text = false,
	})

	local has_saga, saga = pcall(require, "lspsaga")
	if has_saga then
		saga.init_lsp_saga()
	end

	require("lsp.servers.dockerls").setup()
	require("lsp.servers.null_ls").setup()
	require("lsp.servers.sumneko").setup()
	require("lsp.servers.terraformls").setup()
	require("lsp.servers.tsserver").setup()
end

return M
