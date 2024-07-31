local command = require("utils.commands")

vim.api.nvim_create_user_command("OpenGnomeTerminal", command.open_gnome_terminal, {})
