return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local format_options = { lsp_fallback = true, async = false, timeout = 500 }

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				python = { "black" },
				html = { "prettier" },
				jinja = { "djlint" },
				vue = { "prettier", "eslint_d" },
				htmldjango = { "djlint" },
				markdown = { "markdownlint" },
				bash = { "beautysh" },
				xml = { "xmlformatter" },
				svg = { "xmlformatter" },
				-- php = { "php_cs_fixer" },
			},
			format_on_save = format_options,
			-- Conform will notify you when a formatter errors
			notify_on_error = true,
			-- Conform will notify you when no formatters are available for the buffer
			notify_no_formatters = true,
		})

		vim.keymap.set("n", "<leader>f", function()
			conform.format(format_options)
		end, {
			desc = "Format",
		})
	end,
}
