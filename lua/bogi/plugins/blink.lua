return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets", "hrsh7th/nvim-cmp" },
		version = "1.*",
		opts = {
			keymap = {
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<CR>"] = { "select_and_accept", "fallback" },
				["<C-space>"] = { "select_and_accept", "fallback" },
				["<C-e>"] = {},
				["<C-n>"] = { "scroll_documentation_down" },
				["<C-u>"] = { "scroll_documentation_up" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
			completion = {
				trigger = {
					show_on_backspace = false,
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
					update_delay_ms = 50,
					window = {
						border = "single",
					},
				},
				accept = {
					auto_brackets = {
						enabled = false,
					},
					dot_repeat = false,
				},
				menu = {
					enabled = true,
					auto_show = true,
					draw = {
						treesitter = { "lsp" },
					},
					border = "single",
					min_width = 60,
					max_height = 15,
					scrollbar = true,
				},
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		opts_extend = { "sources.default" },
	},
}
