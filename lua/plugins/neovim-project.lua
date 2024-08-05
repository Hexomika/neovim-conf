return {
	"coffebar/neovim-project",
	opts = {
		-- project directories
		projects = {
			"~/Documents/projects/hexolis/python/*",
			"~/Documents/projects/perso/lua/*",
			"~/.config/nvim",
			"~/.sshfs/swiv/projects/js/*", -- glob pattern is supported
			"~/.sshfs/swiv/projects/js/capacitor/*", -- glob pattern is supported
			"~/.sshfs/swiv/projects/python/*", -- glob pattern is supported
			"~/.sshfs/swiv/argamato/clients/*", -- glob pattern is supported
		},
		-- path to store history and sessions
		datapath = vim.fn.stdpath("data"), -- ~/.local/share/nvim/
		-- load the most recent session on startup if not in the project directory
		last_session_on_startup = true,
		-- dashboard mode prevent session autoload on startup
		dashboard_mode = false,
		-- timeout in milliseconds before trigger filetype autocmd after session load
		-- to make sure lsp servers are attached to the current buffer.
		-- set to 0 to disable triggering filetype autocmd
		filetype_autocmd_timeout = 200,

		-- overwrite some of session manager options
		session_manager_opts = {
			autosave_ignore_dirs = {
				vim.fn.expand("~"), -- don't create a session for $home/
				"/tmp",
			},
			autosave_ignore_filetypes = {
				-- all buffers of these file types will be closed before the session is saved
				"ccc-ui",
				"gitcommit",
				"gitrebase",
				"qf",
				"toggleterm",
			},
		},
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
}
