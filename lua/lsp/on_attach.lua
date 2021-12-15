local on_attach = function(client, bufnr)
  if client.name == "typescript" then
    local has_ts_utils, ts_utils = pcall(require, "nvim-lsp-ts-utils")
    if has_ts_utils then
      ts_utils.setup({
        enable_import_on_completion = true,
      })
      ts_utils.setup_client(client)
    end
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

return on_attach
