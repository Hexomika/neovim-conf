local command = require("utils.commands")

vim.api.nvim_create_user_command("OpenTmuxTerminalV", command.open_tmux_gnome_terminal_vertical, {})
vim.api.nvim_create_user_command("OpenTmuxTerminalNewWindow", command.open_tmux_new_window, {})
-- vim.api.nvim_create_user_command("LSPManualEnable", command.enable_manual_lsp, {})
