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

	require("lsp.tsserver").setup()
	require("lsp.sumneko").setup()
	require("lsp.null_ls").setup()
end

return M
