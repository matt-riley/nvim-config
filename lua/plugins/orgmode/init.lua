local M = {}

M.config = function()
  local has_orgmode, orgmode = pcall(require, "orgmode")
  if not has_orgmode then
    return
  end
  local company = os.getenv("COMPANY") or "personal"
  orgmode.setup({
    org_agenda_files = { "~/org/**/*" },
    org_default_notes_file = "~/org/refile.org",
    org_hide_emphasis_markers = true,
    org_agenda_text_search_extra_files = { "agenda-archives" },
    org_todo_keywords = {
      "TODO(t)",
      "PROGRESS(p)",
      "|",
      "DONE(d)",
      "REJECTED(r)",
    },
    org_agenda_templates = {
      t = { description = "Todo", template = "* TODO %?\n  DEADLINE: %T" },
      W = {
        description = "Work Todo",
        template = "* TODO %?\n  DEADLINE: %T",
        target = "~/org/work/todos.org",
      },
      n = { description = "Note", template = "* NOTE\n\n %?\n %u" },
      w = {
        description = "Work Note",
        template = "* :COMPANY: "
          .. company
          .. "\n ** NOTE\n\n %?\n\n :CREATED: %U\n\n",
        target = "~/org/work/notes.org",
      },
    },
  })
end

return M
