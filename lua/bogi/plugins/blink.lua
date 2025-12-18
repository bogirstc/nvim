return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
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
			completion = {
				trigger = {
					show_on_backspace = true,
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
					update_delay_ms = 50,
					treesitter_highlighting = true, -- disable if issues with performance exist
					draw = function(opts)
						opts.default_implementation()
					end,
					window = {
						border = "single",
						winblend = 0,
					},
				},
				accept = { auto_brackets = { enabled = false } },
				menu = {
					enabled = true,
					auto_show = true,
					draw = {
						columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
						align_to = "label",
						treesitter = { "lsp" },
						border = "single",
					},
					window = {
						border = "single",
					},
					ghost_tex = { enabled = true },
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
