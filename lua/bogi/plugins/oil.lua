return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function(_, opts)
			require("oil").setup({
				default_file_explorer = true,
				columns = {
					"permissions",
					"mtime",
					"size",
				},

				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				prompt_save_on_select_new_entry = false,
				constrain_cursor = "name",

				keymaps = {
					["g?"] = { "actions.show_help", mode = "n" },
					["<CR>"] = "actions.select",
					["<C-s>"] = { "actions.select", opts = { vertical = true } },
					["<C-h>"] = { "actions.select", opts = { horizontal = true } },
					["t"] = { "actions.select", opts = { tab = true } },
					["<C-p>"] = "actions.preview",
					["<C-c>"] = false,
					["<C-l>"] = "actions.refresh",
					["-"] = { "actions.parent", mode = "n" },
					["_"] = { "actions.open_cwd", mode = "n" },
					["`"] = { "actions.cd", mode = "n" },
					["cd"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
					["gs"] = { "actions.change_sort", mode = "n" },
					["gx"] = "actions.open_external",
					["g."] = { "actions.toggle_hidden", mode = "n" },
					["g\\"] = { "actions.toggle_trash", mode = "n" },
					["Esc"] = false,
				},

				use_default_keymaps = true,

				view_options = {
					show_hidden = true,
					natural_order = "fast",
					case_insensitive = false,

					is_hidden_file = function(name, bufnr)
						local m = name:match("^%.")
						return m ~= nil
					end,

					is_always_hidden = function(name, bufnr)
						local m = name:match("^%node_modules$")
						return m ~= nil
					end,
				},
				float = {
					padding = 2,
					max_width = 0,
					max_height = 0,
					border = nil,
					win_options = {
						winblend = 0,
					},
					-- preview_split: Split direction: "auto", "left", "right", "above", "below".
					preview_split = "auto",
					override = function(conf)
						return conf
					end,
				},
				preview_win = {
					update_on_cursor_moved = true,
					preview_method = "fast_scratch",
					disable_preview = function(filename)
						return false
					end,
				},
				confirmation = {
					max_width = 0.9,
					min_width = { 40, 0.4 },
					width = nil,
					max_height = 0.9,
					min_height = { 5, 0.1 },
					height = nil,
					border = nil,
					win_options = {
						winblend = 0,
					},
				},
				progress = {
					max_width = 0.9,
					min_width = { 40, 0.4 },
					width = nil,
					max_height = { 10, 0.9 },
					min_height = { 5, 0.1 },
					height = nil,
					border = nil,
					minimized_border = "none",
					win_options = {
						winblend = 0,
					},
				},
				ssh = {
					border = nil,
				},
				keymaps_help = {
					border = nil,
				},
			})
		end,
	},
}
