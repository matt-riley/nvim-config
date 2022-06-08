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
      json = {
        schemas = {
          {
            fileMatch = { "package.json" },
            url = "https://json.schemastore.org/package.json",
          },
          {
            fileMatch = { "tsconfig.json", "tsconfig.*.json" },
            url = "http://json.schemastore.org/tsconfig",
          },
        },
      },
    },
  }
  lsp.jsonls.setup(opts)
end

return M
