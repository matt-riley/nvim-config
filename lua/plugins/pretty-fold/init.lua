local M = {}

M.config = function()
  local has_pretty, pretty_fold = pcall(require, "pretty-fold")
  if not has_pretty then
    return
  end
  vim.opt.fillchars:append("fold:•")

  pretty_fold.setup({
    fill_char = "━",
    sections = {
      left = {
        "━ ",
        function()
          return string.rep("*", vim.v.foldlevel)
        end,
        " ━┫",
        "content",
        "┣",
      },
      right = {
        "┫ ",
        "number_of_folded_lines",
        ": ",
        "percentage",
        " ┣━━",
      },
    },
    remove_fold_markers = true,

    -- Keep the indentation of the content of the fold string.
    keep_indentation = false,

    -- Possible values:
    -- "delete" : Delete all comment signs from the fold string.
    -- "spaces" : Replace all comment signs with equal number of spaces.
    -- false    : Do nothing with comment signs.
    comment_signs = {},

    -- List of patterns that will be removed from content foldtext section.
    stop_words = {},

    add_close_pattern = true,
    matchup_patterns = {
      { "{", "}" },
      { "%(", ")" }, -- % to escape lua pattern char
      { "%[", "]" }, -- % to escape lua pattern char
      { "if%s", "end" },
      { "do%s", "end" },
      { "for%s", "end" },
    },
  })
end

return M
