return {
	"nosduco/remote-sshfs.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("remote-sshfs").setup({

			handlers = {
				on_connect = {
					change_dir = true,
				},
				on_disconnect = {
					clean_mount_folders = true,
				},
			},
			ui = {
				confirm = {
					connect = false,
					change_dir = true,
				},
			},
		})
	end,
}
