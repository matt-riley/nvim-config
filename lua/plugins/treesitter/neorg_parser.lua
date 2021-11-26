local M = {}

M.create_parser = function()
  local has_treesitter = pcall(require, "nvim-treesitter")
  if not has_treesitter then
    return
  end
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

  parser_config.norg = {
    install_info = {
      url = "https://github.com/nvim-neorg/tree-sitter-norg",
      branch = "main",
      files = { "src/parser.c", "src/scanner.cc" },
    },
  }
  return parser_config.norg
end

return M
