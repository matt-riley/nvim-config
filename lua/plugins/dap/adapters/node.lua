local has_dap, dap = pcall(require, "dap")

if not has_dap then
  return
end

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {
    os.getenv("HOME")
      .. "/Documents/projects/vscode-node-debug2/out/src/nodeDebug.js",
  },
}
