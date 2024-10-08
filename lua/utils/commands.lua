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

-- buffers switch keymap
M.go_to_buffer = function()
	local buf_number = vim.fn.input("Enter buffer number: ")
	buf_number = tonumber(buf_number)
	if buf_number then
		vim.cmd("BufferLineGoToBuffer " .. buf_number)
	else
		print("Invalid buffer number")
	end
end

return M
