return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				indicator = {
					style = "underline",
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
