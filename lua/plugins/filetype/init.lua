local M = {}

M.config = function()
  local has_filetype, filetype = pcall(require, "filetype")
  if not has_filetype then
    return
  end

  filetype.setup({
    overrides = {
      extensions = {
        cr = "crystal",
        tf = "terraform",
      },
    },
  })
end

return M
