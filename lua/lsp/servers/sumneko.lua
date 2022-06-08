local sumneko = {}

sumneko.setup = function()
  local lsp = require("lspconfig")
  local on_attach = require("lsp.on_attach")
  local opts = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = require("lsp.capabilities"),
    flags = { debounce_text_changes = 150 },
  }
  opts = require("lua-dev").setup(opts)
  lsp.sumneko_lua.setup(opts)
end

return sumneko
