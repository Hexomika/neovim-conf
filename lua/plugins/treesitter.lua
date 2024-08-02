return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "vue" },

			autotag = {
				enable = true,
			},

			auto_install = true,
			sync_install = false,
			ignore_install = {},
			modules = {},

			highlight = {
				enable = true,
				custom_captures = {
					-- Associer des captures Tree-sitter à des groupes de surbrillance
					["tag.name"] = "TSVueTag",
					["component.name"] = "TSVueComponentName",
					["attribute.name"] = "TSVueAttributeName",
					["directive.name"] = "TSVueDirectiveName",
				},
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ss",
					node_incremental = "<leader>si",
					scope_incremental = "<leader>sc",
					node_decremental = "<leader>sd",
				},
			},

			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["as"] = { query = "@scope", query_group = "locals", desc = "select language scope" },
					},
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "v",
						["@class.outer"] = "<c-v>",
					},
					include_surrounding_whitespace = true,
				},
			},

			context_commentstring = {
				config = {
					javascript = {
						__default = "// %s",
						jsx_element = "{/* %s */}",
						jsx_fragment = "{/* %s */}",
						jsx_attribute = "// %s",
						comment = "// %s",
					},
					typescript = { __default = "// %s", __multiline = "/* %s */" },
				},
			},
		})

		-- require("lspconfig").vuels.setup({
		-- 	cmd = { "vls" },
		-- 	filetypes = { "vue" },
		-- 	init_options = {
		-- 		config = {
		-- 			css = {},
		-- 			emmet = {},
		-- 			html = {
		-- 				suggest = {},
		-- 			},
		-- 			javascript = {
		-- 				format = {},
		-- 			},
		-- 			stylusSupremacy = {},
		-- 			typescript = {
		-- 				format = {},
		-- 			},
		-- 			vetur = {
		-- 				completion = {
		-- 					autoImport = false,
		-- 					tagCasing = "kebab",
		-- 					useScaffoldSnippets = false,
		-- 				},
		-- 				format = {
		-- 					defaultFormatter = {
		-- 						js = "none",
		-- 						ts = "none",
		-- 						html = "prettier-eslint",
		-- 					},
		-- 					defaultFormatterOptions = {},
		-- 					scriptInitialIndent = false,
		-- 					styleInitialIndent = false,
		-- 				},
		-- 				useWorkspaceDependencies = false,
		-- 				validation = {
		-- 					script = true,
		-- 					style = true,
		-- 					template = true,
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })
	end,
}
