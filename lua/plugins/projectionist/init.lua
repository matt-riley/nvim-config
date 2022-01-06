local M = {}

M.config = function()
  local has_projectionist = pcall(require, "projectionist")
  if not has_projectionist then
    return
  end
  vim.g.projectionist_heuristics = {
    ["src/*"] = {
      ["*.ts"] = {
        alternate = "{dirname}/{basename}.spec.ts",
      },
      ["*.spec.ts"] = {
        type = "test",
        alternate = "{dirname}/{basename}.ts",
      },
      ["*.service.ts"] = {
        type = "service",
      },
      ["*.controller.ts"] = {
        type = "controller",
      },
      ["*.module.ts"] = {
        type = "module",
      },
    },
  }
end

return M
