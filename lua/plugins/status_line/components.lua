return {
	lsp_server = {
		-- Lsp server name .
		function()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
			local clients = vim.lsp.get_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config and client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end,
		icon = " LSP:",
		color = { gui = "bold" },
	},
	get_env = {
		function(variable)
			local venv = os.getenv(variable)
			if venv ~= nil and string.find(venv, "/") then
				local orig_venv = venv
				for w in orig_venv:gmatch("([^/]+)") do
					venv = w
				end
				venv = string.format("%s", venv)
			end
			return venv
		end,
	},
}
