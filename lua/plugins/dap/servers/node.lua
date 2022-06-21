local M = {}

M.setup = function()
  local has_dap, dap = pcall(require, "dap")

  if not has_dap then
    return
  end

  dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = {
      os.getenv("HOME") .. "/Documents/projects/personal/vscode-node-debug2/out/src/nodeDebug.js",
    },
  }
  dap.configurations.typescript = {
    {
      type = "node2",
      name = "node launch file",
      request = "launch",
      runtimeExecutable = "node",
      runtimeArgs = { "--nolazy", "-r", "ts-node/register" },
      args = { "${file}" },
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = "Attach to process",
      type = "node2",
      request = "attach",
      processId = require("dap.utils").pick_process,
    },
  }

  dap.configurations.javascript = {
    {
      name = "Launch",
      type = "node2",
      request = "launch",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = "Attach to process",
      type = "node2",
      request = "attach",
      processId = require("dap.utils").pick_process,
    },
  }
end

return M
