local M = {}

M.setup = function()
  local has_lsp_install_server, lsp_install_server = pcall(require, "nvim-lsp-installer.servers")
  if not has_lsp_install_server then
    return
  end
  local server_available, requested_server = lsp_install_server.get_server("solargraph")

  if server_available then
    requested_server:on_ready(function()
      local ts_utils = require("nvim-lsp-ts-utils")
      local on_attach = require("lsp.on_attach")

      local ts_utils_options = {
        enable_import_on_completion = true,
        update_imports_on_move = true,
        require_confirmation_on_move = true,
      }

      local opts = {
        init_options = ts_utils.init_options,
        on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = false
          client.resolved_capabilities.document_range_formatting = false

          on_attach(client, bufnr)

          ts_utils.setup(ts_utils_options)
          ts_utils.setup_client(client)
        end,
        capabilities = require("lsp.capabilities"),
        flags = { debounce_text_changes = 150 },
      }

      requested_server:setup(opts)
    end)
  end
end

return M
