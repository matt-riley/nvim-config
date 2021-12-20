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
    grey_out_search_area = true,
    highlight_unique_chars = true,
    match_only_the_start_of_same_char_seqs = true,
    jump_on_partial_input_safety_timeout = 400,
    substitute_chars = { ["\r"] = "¬" },
    cycle_group_fwd_key = "<space>",
    cycle_group_bwd_key = "<tab>",

    -- f/t
    limit_ft_matches = 4,
    repeat_ft_with_target_char = false,
  })
end

return M
