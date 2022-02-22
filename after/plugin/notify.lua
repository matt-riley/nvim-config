vim.notify = function(msg, level, opts)
  require("notify")(msg, level, opts)
end
