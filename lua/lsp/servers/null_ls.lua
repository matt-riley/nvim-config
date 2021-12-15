local M = {}

M.setup = function()
  local has_null, null_ls = pcall(require, "null-ls")
  if has_null then
    local b = null_ls.builtins
    local null_config = {
      sources = {
        -- diagnostics
        b.diagnostics.eslint.with({
          condition = function(utils)
            return utils.root_has_file(".eslintrc.js")
              or utils.root_has_file(".eslintrc")
              or utils.root_has_file(".eslintrs.json")
          end,
        }),
        b.diagnostics.selene, -- A blazing-fast modern Lua linter written in Rust
        b.diagnostics.hadolint, -- Dockerfile linter, validate inline bash, written in Haskell
        b.diagnostics.shellcheck,
        -- formatting
        b.formatting.stylua,
        b.formatting.eslint.with({
          condition = function(utils)
            return utils.root_has_file(".eslintrc.js")
              or utils.root_has_file(".eslintrc")
              or utils.root_has_file(".eslintrs.json")
          end,
        }),
        b.formatting.terraform_fmt,
        b.formatting.golines.with({
          args = { "-m", "80", "--chain-split-dots", "-t", "2" },
        }),
        b.formatting.prettier.with({
          prefer_local = "node_modules/.bin",
        }),
        b.formatting.scalafmt,
        b.formatting.shfmt,
        b.formatting.shellharden,
      },
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.cmd(
            "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()"
          )
        end
      end,
    }
    null_ls.setup(null_config)
  end
end

return M
