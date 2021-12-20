local display = function()
  local has_pack_display, packer = pcall(require, "packer")
  if not has_pack_display then
    return
  end
  print(vim.inspect(packer))
end

return display
