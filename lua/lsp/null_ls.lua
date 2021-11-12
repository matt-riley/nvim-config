local M = {}

M.setup = function()
	local has_null, null_ls = pcall(require, "null-ls")
	local lsp = require("lspconfig")
	if has_null then
		local b = null_ls.builtins
		local null_config = {
			sources = {
				-- diagnostics
				b.diagnostics.eslint_d,
				b.diagnostics.selene, -- A blazing-fast modern Lua linter written in Rust
				b.diagnostics.hadolint, -- Dockerfile linter, validate inline bash, written in Haskell
				-- formatting
				b.formatting.stylua,
				b.formatting.eslint_d,
				b.formatting.terraform_fmt,
				b.formatting.golines.with({
					args = { "-m", "80", "--chain-split-dots", "-t", "2" },
				}),
				b.formatting.prettierd,
				b.formatting.scalafmt,
				b.code_actions.gitsigns,
			},
		}
		null_ls.config(null_config)
		lsp["null-ls"].setup({ on_attach = require("lsp.on_attach") })
	end
end

return M
