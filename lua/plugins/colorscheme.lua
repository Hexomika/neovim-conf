return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			overrides = function()
				return {
					NeoTreeGitModified = {
						fg = "#ffd900",
					},
				}
			end,
		})
		vim.cmd.colorscheme("kanagawa-wave")
	end,
}
