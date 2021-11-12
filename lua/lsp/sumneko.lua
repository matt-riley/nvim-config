local sumneko = {}

sumneko.setup = function()
	local lsp_install_server = require("nvim-lsp-installer.servers")
	local server_available, requested_server = lsp_install_server.get_server("sumneko_lua")

	if server_available then
		requested_server:on_ready(function()
			local opts = {
				on_attach = require("lsp.on_attach"),
				capabilities = require("lsp.capabilities"),
				flags = { debounce_text_changes = 150 },
			}

			opts = require("lua-dev").setup(opts)

			requested_server:setup(opts)
		end)
	end
end

return sumneko
