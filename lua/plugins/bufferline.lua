return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				mode = "buffers",
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
				-- highlight = {
				-- 	bg = {
				-- 		attribite = "fg",
				-- 		highlight = "Pmenu",
				-- 	},
				-- },
				-- buffer_visible = {
				-- 	fg = "<colour-value-here>",
				-- 	bg = "<colour-value-here>",
				-- },
			},
		})
		local opts = {
			noremap = true,
			silent = true,
		}

		-- buffers switch keymap
		vim.api.nvim_set_keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 10<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 11<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 12<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 13<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 14<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 15<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 16<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 17<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 18<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 19<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 20<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>w", ":BufferLinePickClose<CR>", opts)
	end,
}
