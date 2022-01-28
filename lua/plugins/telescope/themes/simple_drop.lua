local simple_drop = function()
  return require("telescope.themes").get_dropdown({
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    width = 0.8,
    previewer = false,
    prompt_title = false,
  })
end

return simple_drop()
