return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local components = require("plugins.status_line.components")

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = {},
				section_separators = {},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype", components.lsp_server },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "nvim-tree", "toggleterm", "quickfix" },
		})
	end,
}

-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	event = "VeryLazy",
-- 	config = function()
-- 		local components = require("plugins.status_line.components")
--
-- 		require("lualine").setup({
-- 			options = {
-- 				icons_enabled = true,
-- 				theme = "auto",
-- 				component_separators = { left = "", right = "" },
-- 				section_separators = { left = "", right = "" },
-- 				disabled_filetypes = {
-- 					statusline = { "lazy" },
-- 					winbar = {
-- 						"help",
-- 						"lazy",
-- 					},
-- 				},
-- 				always_divide_middle = true,
-- 				globalstatus = true,
-- 			},
-- 			sections = {
-- 				lualine_a = { "mode" },
-- 				lualine_b = { components.git_repo, "branch" },
-- 				lualine_c = { components.diff, components.diagnostics, components.separator, components.lsp_client },
-- 				lualine_x = { "filename", components.spaces, "encoding", "fileformat", "filetype", "progress" },
-- 				lualine_y = {},
-- 				lualine_z = { "location" },
-- 			},
-- 			inactive_sections = {
-- 				lualine_a = {},
-- 				lualine_b = {},
-- 				lualine_c = { "filename" },
-- 				lualine_x = { "location" },
-- 				lualine_y = {},
-- 				lualine_z = {},
-- 			},
-- 			extensions = { "nvim-tree", "toggleterm", "quickfix" },
-- 		})
-- 	end,
-- }
