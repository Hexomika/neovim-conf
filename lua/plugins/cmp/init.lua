return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			"saadparwaiz1/cmp_luasnip",
			"lukas-reineke/cmp-under-comparator",
			"f3fora/cmp-spell",
			"lukas-reineke/cmp-rg",
			"onsails/lspkind.nvim", --lspkind icons
		},
		config = function()
			local cmp = require("cmp")
			local cmplsp = require("cmp_nvim_lsp")
			local luasnip = require("luasnip")
			local mapping = require("plugins.cmp.mapping")
			local compare = require("cmp.config.compare")
			local lspkind = require("lspkind")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmplsp.setup()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noinsert",
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sorting = {
					priority_weight = 1.0,
					comparators = {
						compare.offset,
						compare.exact,
						compare.score,
						compare.recently_used,
						require("cmp-under-comparator").under,
						compare.kind,
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = mapping.supertab(),
					["<S-Tab>"] = mapping.shift_supertab(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-p>"] = mapping.jump_backward(),
					["<C-n>"] = mapping.jump_forward(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
				formatting = { ---@diagnostic disable-line: missing-fields
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,

						before = function(entry, vim_item) ---@diagnostic disable-line: unused-local
							return vim_item
						end,
					}),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}, {
					{ name = "path" },
				}),
				{ name = "nvim_lsp_signature_help", max_item_count = 5 },
				{
					name = "spell",
					max_item_count = 5,
					keyword_length = 3,
					option = {
						keep_all_entries = false,
						enable_in_context = function()
							return true
						end,
					},
				},
				{ name = "rg", keyword_length = 3 },
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
}
