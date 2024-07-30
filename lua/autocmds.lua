local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("myns", {})

autocmd("TextYankPost", {
	group = "myns",
	pattern = "*",
	desc = "Highlight text on yank",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

autocmd("BufWritePre", {
	group = "myns",
	pattern = "*",
	desc = "Remove trailing whitespace on save",
	command = [[%s/\s\+$//e]],
})

autocmd("CursorHold", {
	group = "myns",
	pattern = "*",
	callback = function()
		vim.schedule(vim.diagnostic.open_float)
	end,
})
