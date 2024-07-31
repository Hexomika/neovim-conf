return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"olacin/telescope-cc.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({})
		telescope.load_extension("fzf") -- search plugin
		telescope.load_extension("conventional_commits") -- git plugin
		-- telescope.load_extension("projects") -- projects plugin
		telescope.load_extension("remote-sshfs") -- remote ssh plugin

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>", {
			desc = "Telescope find files",
		})
		vim.keymap.set("n", "<leader>pg", "<cmd>Telescope git_files<cr>", {
			desc = "Telescope git files",
		})
		vim.keymap.set("n", "<leader>pb", "<cmd>Telescope buffers<cr>", {
			desc = "Telescope buffers",
		})
		vim.keymap.set("n", "<leader>pt", "<cmd>TodoTelescope<cr>", {
			desc = "TodoTelescope",
		})

		vim.keymap.set("n", "<leader>gc", "<cmd>Telescope conventional_commits<cr>", {
			desc = "Telescope conventional commits",
		})

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, {
			desc = "Help tags",
		})
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, {
			desc = "Grep String",
		})
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, {
			desc = "Grep live",
		})
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {
			desc = "Diagnostics",
		})
		vim.keymap.set("c", "<C-p>", builtin.commands, {
			desc = "Commands",
		})
		vim.keymap.set("c", "<C-r>", builtin.command_history, {
			desc = "Command history",
		})
		-- vim.keymap.set("n", "<leader>r", "<cmd>Telescope projects<cr>", {
		-- 	desc = "Telescope projects",
		-- })

		vim.keymap.set("n", "<leader>r", "<cmd>Telescope neovim-project discover<cr>", {
			desc = "Telescope projects",
		})
		vim.keymap.set("n", "<leader>ssh", "<cmd>RemoteSSHFSConnect<cr>", {
			desc = "Remote sshfs connect",
		})
	end,
}
