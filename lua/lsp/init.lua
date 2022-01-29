local M = {}

M.config = function()
  local lsp = vim.lsp

  lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics,
    {
      underline = true,
      signs = true,
      virtual_text = false,
    }
  )

  local has_saga, saga = pcall(require, "lspsaga")
  if has_saga then
    saga.init_lsp_saga()
  end

  require("lsp.servers.bash").setup()
  require("lsp.servers.crystal").setup()
  require("lsp.servers.css").setup()
  require("lsp.servers.dockerls").setup()
  require("lsp.servers.html").setup()
  require("lsp.servers.jsonls").setup()
  require("lsp.servers.nim").setup()
  require("lsp.servers.null_ls").setup()
  require("lsp.servers.rust").setup()
  require("lsp.servers.sumneko").setup()
  require("lsp.servers.terraformls").setup()
  require("lsp.servers.toml").setup()
  require("lsp.servers.tsserver").setup()
  require("lsp.servers.yamlls").setup()
  require("lsp.servers.zig").setup()
end

return M
