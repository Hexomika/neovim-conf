return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "j-hui/fidget.nvim", opts = {} },
		--{ "mrcjkb/rustaceanvim", version = "^4", lazy = false },
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- local capabilities = vim.tbl_deep_extend(
		-- 	"force",
		-- 	{},
		-- 	vim.lsp.protocol.make_client_capabilities(),
		-- 	require("cmp_nvim_lsp").default_capabilities()
		-- )

		local lsp_servers = {
			"html",
			"lua_ls",
			"emmet_ls",
			"cssls",
			"yamlls",
			"volar",
			"ts_ls",
			"eslint",
			"bashls",
			"jinja_lsp",
			"jsonls",
			"markdown_oxide",
			"pylsp",
			"svelte",
			"nginx_language_server",
			"cmake",
			"csharp_ls",
			"css_variables",
			"docker_compose_language_service",
			"dockerls",
			"intelephense",
		}

		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = lsp_servers,
			automatic_installation = true,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"xmlformatter",
				"markdownlint",
				"djlint",
				"prettierd",
				"html",
				"beautysh",
				"yamlfix",
				"flake8",
				"sonarlint-language-server",
				"pylama",
				"eslint_d",
			},
			run_on_start = true,
		})

		require("mason-lspconfig").setup_handlers({
			-- ["lua_ls"] = require("plugins.lsp.servers.lua_ls").setup(capabilities),
			-- ["pylsp"] = function()
			-- 	require("lspconfig").pylsp.setup({
			-- 		capabilities = capabilities,
			-- 		settings = {
			-- 			pylsp = {
			-- 				plugins = {
			-- 					pyflakes = { enabled = false },
			-- 					pylint = { enabled = true },
			-- 					black = { enabled = true },
			-- 					isort = { enabled = true },
			-- 					autopep8 = { enabled = false },
			-- 					-- auto-completion options
			-- 					jedi_completion = { fuzzy = true },
			-- 					-- import sorting
			-- 					pyls_isort = { enabled = true },
			-- 				},
			-- 			},
			-- 		},
			-- 	})
			-- end,
			-- -- jinja
			-- ["jinja_lsp"] = function()
			-- 	require("lspconfig").jinja_lsp.setup({
			-- 		capabilities = capabilities,
			-- 		filetypes = { "htmldjango", "jinja", "jinja.html" },
			-- 	})
			-- end,
			-- ["volar"] = function()
			-- 	require("lspconfig").volar.setup({
			-- 		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
			-- 	})
			-- end,

			function(server_name)
				require("lspconfig")[server_name].setup({ capabilities = capabilities })
			end,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function()
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>")
				vim.keymap.set("n", "gD", "<cmd>Telescope lsp_declarations<cr>")
				vim.keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<cr>")
				vim.keymap.set("n", "gb", "<cmd>Telescope lsp_type_definitions<cr>")
				vim.keymap.set("n", "K", vim.lsp.buf.hover)
				vim.keymap.set("n", "gK", vim.lsp.buf.signature_help)
				vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
				vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
			end,
		})

		require("plugins.lsp.snippets.all")
	end,
}
