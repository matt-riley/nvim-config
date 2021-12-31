local M = {}

M.setup = function()
  local has_lsp_install_server, lsp_install_server = pcall(
    require,
    "nvim-lsp-installer.servers"
  )
  if not has_lsp_install_server then
    return
  end
  local server_available, requested_server = lsp_install_server.get_server(
    "cssls"
  )

  if server_available then
    requested_server:on_ready(function()
      local on_attach = require("lsp.on_attach")

      local opts = {
        on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = false
          client.resolved_capabilities.document_range_formatting = false

          on_attach(client, bufnr)
        end,
        capabilities = require("lsp.capabilities"),
        flags = { debounce_text_changes = 150 },
      }

      requested_server:setup(opts)
    end)
  end
end

return M
