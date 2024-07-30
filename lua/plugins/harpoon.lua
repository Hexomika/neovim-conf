return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- require("harpoon-tabline").setup()

		harpoon:setup({})

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		local group = vim.api.nvim_create_augroup("harpoonGroup", { clear = true })

		-- Save exact cursor position when leaving buffer
		vim.api.nvim_create_autocmd({ "BufLeave", "ExitPre" }, {
			pattern = "*",
			group = group,
			callback = function()
				local filename = vim.fn.expand("%:p:.")
				local harpoon_marks = harpoon:list().items
				for _, mark in ipairs(harpoon_marks) do
					if mark.value == filename then
						mark.context.row = vim.fn.line(".")
						mark.context.col = vim.fn.col(".")
						return
					end
				end
			end,
		})

		vim.api.nvim_create_autocmd({ "Filetype" }, {
			pattern = "harpoon",
			group = group,
			callback = function()
				vim.opt.cursorline = true
			end,
		})

		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-x>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, { buffer = cx.bufnr })
			end,
		})

		vim.keymap.set("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, {
			desc = "Add persisted buffer",
		})
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():next()
		end)
		vim.keymap.set("n", "<C-p>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-&>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-é>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", '<C-">', function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-'>", function()
			harpoon:list():select(4)
		end)
	end,
}
