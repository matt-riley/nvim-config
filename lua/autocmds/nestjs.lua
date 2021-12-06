local Job = require("plenary.job")
local M = {}
M.on_enter = function()
  local tmux = os.getenv("TMUX")
  if not tmux then
    return
  end
  Job
    :new({
      command = "tmux",
      args = {
        "send-keys",
        "-t",
        "right",
        "echo 'nestjs'",
        "Enter",
      },
      on_exit = function()
        print("done")
      end,
    })
    :sync()
end

return M
