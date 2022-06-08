local M = {}

M.config = function()
  local lsp = vim.lsp
  local has_lsp_install, lspinstall = pcall(require, "nvim-lsp-installer")
  if has_lsp_install then
    lspinstall.setup({
      automatic_installation = true,
      log_level = vim.log.levels.DEBUG,
    })
  end

  lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    signs = true,
    virtual_text = false,
  })

  local has_saga, saga = pcall(require, "lspsaga")

  if has_saga then
    saga.init_lsp_saga()
  end

  require("lsp.ui").setup()

  require("lsp.servers.bash").setup()
  require("lsp.servers.crystal").setup()
  require("lsp.servers.css").setup()
  require("lsp.servers.dockerls").setup()
  require("lsp.servers.go").setup()
  -- require("lsp.servers.html").setup()
  require("lsp.servers.jsonls").setup()
  -- require("lsp.servers.nim").setup()
  require("lsp.servers.null_ls").setup()
  -- require("lsp.servers.ruby").setup()
  -- require("lsp.servers.rust").setup()
  -- require("lsp.servers.sql").setup()
  require("lsp.servers.sumneko").setup()
  -- require("lsp.servers.svelte").setup()
  require("lsp.servers.terraformls").setup()
  -- require("lsp.servers.toml").setup()
  require("lsp.servers.tsserver").setup()
  require("lsp.servers.yamlls").setup()
  -- require("lsp.servers.zig").setup()
end

return M
