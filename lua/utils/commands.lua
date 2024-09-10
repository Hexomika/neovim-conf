local M = {}

M.has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

M.open_tmux_gnome_terminal_vertical = function()
	os.execute("tmux split-window -h bash")
end

M.open_tmux_new_window = function()
	os.execute("tmux new-window 'bash'")
end

-- Define a custom command to list and choose an LSP to enable
-- TODO
M.enable_manual_lsp = function()
	-- List of available LSP servers (you can expand this list)
	local lsp_servers = {
		"pyright",
		"tsserver",
		"gopls",
		"rust_analyzer",
		"clangd",
		"sumneko_lua",
	}

	-- Prompt the user to select an LSP server from the list
	vim.ui.select(lsp_servers, { prompt = "Select LSP to enable:" }, function(choice)
		if choice then
			-- Setup the chosen LSP server
			require("lspconfig")[choice].setup({})
			-- Start the LSP server for the current buffer
			vim.cmd("LspStart " .. choice)
			print(choice .. " LSP enabled.")
		else
			print("No LSP selected.")
		end
	end)
end

return M
