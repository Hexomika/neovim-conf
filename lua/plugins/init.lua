local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	require("plugins.colorscheme"),
	require("plugins.treesitter"),
	require("plugins.harpoon"),
	require("plugins.telescope"),
	require("plugins.oil"),
	require("plugins.cmp"),
	require("plugins.lsp"),
	require("plugins.lazydev"),
	require("plugins.winbar"),
	require("plugins.status_line"),
	require("plugins.autopairs"),
	require("plugins.colorizer"),
	require("plugins.comment"),
	require("plugins.git"),
	require("plugins.format"),
	require("plugins.harpoon-tabline"),
}

require("lazy").setup(plugins)
