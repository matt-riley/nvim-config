local M = {}

M.setup = function()
  local lsp = require("lspconfig")
  local on_attach = require("lsp.on_attach")
  local opts = {
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      on_attach(client, bufnr)
    end,
    capabilities = require("lsp.capabilities"),
    flags = { debounce_text_changes = 150 },
    settings = {
      redhat = { telemetry = false },
      yaml = {
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        schemaDownload = { enable = true },
      },
    },
  }

  local has_comp = pcall(require, "yaml-companion")
  if has_comp then
    opts = require("yaml-companion").setup({ lspconfig = opts })
  end
  lsp.yamlls.setup(opts)
end

return M
