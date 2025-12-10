return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"andrew-george/telescope-themes",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.load_extension("fzf")
		telescope.load_extension("themes")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			extensions = {
				themes = {
					enable_previewer = true,
					enable_live_preview = true,
					persist = {
						enabled = true,
						path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
					},
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = "fuzzy find open buffers" })
		vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "fuzzy find recent files" })

		vim.keymap.set("n", "<leader>gf", function()
			builtin.git_status()
		end, { desc = "fuzzy find modified git files" })

		vim.keymap.set("n", "<leader>pg", function()
			builtin.grep_string({
				search = vim.fn.input("grep for > "),
			})
		end, { desc = "grep string" })

		vim.keymap.set("n", "<leader>pf", function()
			builtin.find_files({})
		end, { desc = "fuzzy find files" })

		vim.keymap.set("n", "<leader>pa", function()
			builtin.find_files({ hidden = true })
		end, { desc = "fuzzy find all files" })
	end,
}
