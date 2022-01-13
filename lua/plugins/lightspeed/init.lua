local M = {}

M.config = function()
  local has_lightspeed, lightspeed = pcall(require, "lightspeed")
  if not has_lightspeed then
    return
  end

  lightspeed.setup({
    ignore_case = false,
    exit_after_idle_msecs = { labeled = nil, unlabeled = 1000 },

    -- s/x
    match_only_the_start_of_same_char_seqs = true,
    substitute_chars = { ["\r"] = "¬" },

    -- f/t
    limit_ft_matches = 4,
    repeat_ft_with_target_char = false,
  })
end

return M
