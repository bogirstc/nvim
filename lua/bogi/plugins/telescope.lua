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

		vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = "fuzzy find open buffers" })
		vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "fuzzy find recent files" })
		vim.keymap.set("n", "R", "<cmd>Telescope lsp_references<CR>", { desc = "lsp references", silent = true })
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "lsp definitions", silent = true })
		vim.keymap.set(
			"n",
			"<leader>?",
			"<cmd>Telescope current_buffer_fuzzy_find<CR>",
			{ desc = "fuzzy find current buffer" }
		)
		vim.keymap.set(
			"n",
			"gi",
			"<cmd>Telescope lsp_implementations<CR>",
			{ desc = "lsp implementations", silent = true }
		)
		vim.keymap.set(
			"n",
			"gt",
			"<cmd>Telescope lsp_type_definitions<CR>",
			{ desc = "lsp type definitions", silent = true }
		)
		vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", {
			desc = "buffer diagnostics",
			silent = true,
		})

		vim.keymap.set("n", "<leader>gf", function()
			builtin.git_files({ show_untracked = false })
		end, { desc = "fuzzy find modified git files" })

		vim.keymap.set("n", "<leader>pg", function()
			builtin.live_grep({})
		end, { desc = "grep string" })

		vim.keymap.set("n", "<leader>pf", function()
			builtin.fd(require("telescope.themes").get_dropdown({
				previewer = false,
			}))
		end, { desc = "fuzzy find files" })

		vim.keymap.set("n", "<leader>pa", function()
			builtin.fd({ hidden = true })
		end, { desc = "fuzzy find all files" })
	end,
}
