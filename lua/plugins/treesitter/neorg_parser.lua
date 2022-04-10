local M = {}

M.create_parser = function()
  local has_treesitter = pcall(require, "nvim-treesitter")
  if not has_treesitter then
    return
  end
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

  parser_config.norg_meta = {
    install_info = {
      url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
      files = { "src/parser.c" },
      branch = "main",
    },
  }

  parser_config.norg_table = {
    install_info = {
      url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
      files = { "src/parser.c" },
      branch = "main",
    },
  }
end

return M
