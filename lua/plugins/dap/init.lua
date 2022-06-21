local M = {}

M.config = function()
  local has_dap = pcall(require, "dap")

  if not has_dap then
    return
  end

  local sign = vim.fn.sign_define

  sign("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
  sign("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })
  sign("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
  sign("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })

  require("dap-go").setup()
  require("plugins.dap.servers.node").setup()

  require("dapui").setup()
end

M.keymaps = {
  ["<leader>d"] = {
    name = "DAP",
    b = {
      ":lua require'dap'.toggle_breakpoint()<cr>",
      "Toggle Breakpoint",
    },
    c = {
      ":lua require'dap'.continue()<CR>",
      "Continue",
    },
    r = {
      ":lua require'dap'.repl.open()<CR>",
      "REPL",
    },
    so = {
      ":lua require'dap'.step_over()<CR>",
      "Step Over",
    },
    si = {
      ":lua require'dap'.step_into()<CR>",
      "Step Into",
    },
    su = {
      ":lua require'dap'.step_out()<CR>",
      "Step Out",
    },
  },
}

return M
