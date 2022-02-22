local M = {}

M.setup = function()
  local has_null, null_ls = pcall(require, "null-ls")
  if has_null then
    local b = null_ls.builtins
    local null_config = {
      debug = true,
      sources = {
        -- diagnostics
        b.diagnostics.actionlint,
        b.diagnostics.codespell,
        b.diagnostics.eslint,
        b.diagnostics.selene, -- A blazing-fast modern Lua linter written in Rust
        b.diagnostics.hadolint, -- Dockerfile linter, validate inline bash, written in Haskell
        b.diagnostics.shellcheck,
        b.diagnostics.yamllint,
        -- formatting
        b.formatting.stylua,
        b.formatting.terraform_fmt.with({
          filetypes = { "tf", "hcl", "terraform" },
        }),
        b.formatting.golines.with({
          args = { "-m", "80", "--chain-split-dots", "-t", "2" },
        }),
        b.formatting.prettier,
        b.formatting.scalafmt,
        b.formatting.shfmt,
        b.formatting.shellharden,
        b.formatting.nimpretty,
        b.formatting.crystal_format,
        b.formatting.zigfmt,
      },
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
        end
      end,
    }
    null_ls.setup(null_config)
  end
end

return M
