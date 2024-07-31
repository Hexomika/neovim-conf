return {
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			vim.notify = require("notify")
		end,
	},
	{
		"andymass/vim-matchup",
		event = "BufReadPost",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "BufReadPre",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local todo_comments = require("todo-comments")

			vim.keymap.set("n", "<leader>tn", function()
				todo_comments.jump_next()
			end, {
				desc = "Todo comments",
			})
			vim.keymap.set("n", "<leader>tp", function()
				todo_comments.jump_prev()
			end, {
				desc = "Todo Jump",
			})

			todo_comments.setup({})
		end,
	},
}
