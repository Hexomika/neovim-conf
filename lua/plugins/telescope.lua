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
		telescope.setup({
			defaults = {
				-- configure to use ripgrep
				vimgrep_arguments = {
					"rg",
					"--follow", -- Follow symbolic links
					"--hidden", -- Search for hidden files
					"--no-heading", -- Don't group matches by each file
					"--with-filename", -- Print the file path with the matched lines
					"--line-number", -- Show line numbers
					"--column", -- Show column numbers
					"--smart-case", -- Smart case search

					-- Exclude some patterns from search
					"--glob=!**/node_modules/*",
					"--glob=!**/.git/*",
					"--glob=!**/.idea/*",
					"--glob=!**/.vscode/*",
					"--glob=!**/build/*",
					"--glob=!**/dist/*",
					"--glob=!**/yarn.lock",
					"--glob=!**/package-lock.json",
					"--glob=!**/env/*",
					"--glob=!**/android/*",
					"--glob=!**/ios/*",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					-- needed to exclude some files & dirs from general search
					-- when not included or specified in .gitignore
					find_command = {
						"rg",
						"--files",
						"-u", -- ignore .gitignore
						"--hidden",
						"--glob=!**/node_modules/*",
						"--glob=!**/.git/*",
						"--glob=!**/.idea/*",
						"--glob=!**/.vscode/*",
						"--glob=!**/build/*",
						"--glob=!**/dist/*",
						"--glob=!**/yarn.lock",
						"--glob=!**/package-lock.json",
						"--glob=!**/env/*",
						"--glob=!**/android/*",
						"--glob=!**/ios/*",
					},
				},
				grep_string = {
					additional_args = { "--hidden" },
				},
				live_grep = {
					additional_args = { "--hidden" },
				},
			},
		})
		telescope.load_extension("fzf") -- search plugin
		telescope.load_extension("conventional_commits") -- git plugin

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
