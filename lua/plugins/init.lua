local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
require("utils")
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
	require("plugins.cmp"), -- auto complexion
	require("plugins.lsp"),
	require("plugins.lazydev"),
	-- require("plugins.winbar"),
	require("plugins.status_line"),
	require("plugins.autopairs"),
	require("plugins.colorizer"),
	require("plugins.comment"),
	require("plugins.git"),
	require("plugins.format"), -- conform
	require("plugins.bufferline"),
	-- require("plugins.neotest"),
	require("plugins.trouble"),
	-- require("plugins.nvim-lint"), I don't know why it's in my plugins, i keep it just in case
	require("plugins.others"),
	-- require("plugins.project"),
	require("plugins.neovim-project"),
	require("plugins.which-key"),
	require("plugins.neotree"), -- tree
	require("plugins.flash"), -- fast seach
	require("plugins.indentmini"), -- indent bar
	require("plugins.glow"), -- preview md
	require("plugins.diffview"), -- git diffview
	require("plugins.lightbulb"),
	require("plugins.friendly-snippets"),
	require("plugins.venv-selector"),
	-- require("plugins.nvim-html-css"),
}

require("lazy").setup(plugins)
