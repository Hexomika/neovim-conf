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

-- project refresh .dotfiles
local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })

local function update_git_env_for_dotfiles()
	-- Auto change ENV variables to enable
	-- bare git repository for dotfiles after
	-- loading saved session
	local home = vim.fn.expand("~")
	local git_dir = home .. "/dotfiles"

	if vim.env.GIT_DIR ~= nil and vim.env.GIT_DIR ~= git_dir then
		return
	end

	-- check dotfiles dir exists on current machine
	if vim.fn.isdirectory(git_dir) ~= 1 then
		vim.env.GIT_DIR = nil
		vim.env.GIT_WORK_TREE = nil
		return
	end

	-- check if the current working directory should belong to dotfiles
	local cwd = vim.loop.cwd()
	if vim.startswith(cwd, home .. "/.config/") or cwd == home or cwd == home .. "/.local/bin" then
		if vim.env.GIT_DIR == nil then
			-- export git location into ENV
			vim.env.GIT_DIR = git_dir
			vim.env.GIT_WORK_TREE = home
		end
	else
		if vim.env.GIT_DIR == git_dir then
			-- unset variables
			vim.env.GIT_DIR = nil
			vim.env.GIT_WORK_TREE = nil
		end
	end
end

vim.api.nvim_create_autocmd("DirChanged", {
	pattern = { "*" },
	group = augroup,
	desc = "Update git env for dotfiles after changing directory",
	callback = function()
		update_git_env_for_dotfiles()
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = { "SessionLoadPost" },
	group = augroup,
	desc = "Update git env for dotfiles after loading session",
	callback = function()
		update_git_env_for_dotfiles()
	end,
})
