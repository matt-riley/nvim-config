local M = {}

M.config = function()
	local has_orgmode, orgmode = pcall(require, "orgmode")
	if not has_orgmode then
		return
	end
	orgmode.setup({
		org_agenda_files = { "~/org/agendas/**/*" },
		org_default_notes_file = "~/org/notes.org",
	})
end

return M
