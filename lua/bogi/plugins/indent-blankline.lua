return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local highlight = {
			"Love",
			"Gold",
			"Pine",
			"Iris",
			"Foam",
			"Text",
			"Rose",
		}

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "Foam", { fg = "#9ccfd8" })
			vim.api.nvim_set_hl(0, "Love", { fg = "#eb6f92" })
			vim.api.nvim_set_hl(0, "Gold", { fg = "#f6c177" })
			vim.api.nvim_set_hl(0, "Text", { fg = "#e0def4" })
			vim.api.nvim_set_hl(0, "Iris", { fg = "#c4a7e7" })
			vim.api.nvim_set_hl(0, "Rose", { fg = "#ebbcba" })
			vim.api.nvim_set_hl(0, "Pine", { fg = "#31748f" })
		end)

		require("ibl").setup({
			-- indent = { highlight = highlight },
			scope = { highlight = highlight },
		})

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
