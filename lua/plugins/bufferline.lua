return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				mode = "tabs",
				style_preset = bufferline.style_preset.default,
				numbers = "ordinal",
				separator_style = "thick",
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
		local opts = {
			noremap = true,
			silent = true,
		}

		vim.api.nvim_set_keymap("n", "<leader>b", ":GoToBuffer<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>w", ":Bwipeout<CR>", opts)
	end,
}
