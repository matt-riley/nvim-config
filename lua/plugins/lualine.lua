local M = {}

local components = {
	treesitter = {
		function()
			return "  "
		end,
		condition = function()
			if next(vim.treesitter.highlighter.active) then
				return true
			end

			return false
		end,
		color = {
			fg = "green",
		},
	},
	diagnostics = {
		"diagnostics",
		sources = { "nvim_lsp" },
		symbols = { error = " ", warn = " ", info = " ", hint = " " },
	},
}

M.config = function()
	local has_lualine, lualine = pcall(require, "lualine")
	if not has_lualine then
		return
	end

	vim.cmd([[
    augroup HideLuaLine
    au FileType alpha set noshowmode | au WinLeave <buffer> set showmode
    au FileType alpha set noruler | au WinLeave <buffer> set ruler
    au FileType alpha set laststatus=0 | au WinLeave <buffer> set laststatus=2
    au FileType alpha set noshowcmd | au WinLeave <buffer> set showcmd
  augroup end
  ]])
	lualine.setup({
		options = {
			theme = "tokyonight",
			component_separators = { "", "" },
			section_separators = { "", "" },
		},
		disabled_filetypes = {
			"alpha",
		},
		extensions = { "nvim-tree" },
		sections = {
			lualine_c = {
				"filename",
				components.diagnostics,
			},
			lualine_x = {
				"encoding",
				"fileformat",
				components.treesitter,
			},
			lualine_y = {
				"filetype",
			},
		},
	})
end

return M
