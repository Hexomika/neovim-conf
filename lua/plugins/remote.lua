return {
	"Hexomika/remote-nvim.nvim",
	version = "*", -- Pin to GitHub releases
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("remote-nvim").setup({
			git = {
				repository_url = "https://github.com/Hexomika/neovim-conf.git",
			},
			remote = {
				app_name = "nvim",
				copy_dirs = {
					-- Spécifiez les fichiers et répertoires à copier vers le répertoire de configuration Neovim distant
					config = {
						base = vim.fn.stdpath("config"),
						dirs = "*",
						compressio = {
							enabled = false,
							additional_opts = {},
						},
					},
				},
			},
			-- Autres configurations possibles
		})
	end,
}
