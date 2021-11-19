local M = {}

M.create_parser = function()
	local has_treesitter = pcall(require, "nvim-treesitter")
	if not has_treesitter then
		return
	end
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

	parser_config.org = {
		install_info = {
			url = "https://github.com/milisims/tree-sitter-org",
			revision = "main",
			files = { "src/parser.c", "src/scanner.cc" },
		},
		filetype = "org",
	}
	return parser_config.org
end

return M
