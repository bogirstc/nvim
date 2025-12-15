return {
	{
		"nvzone/showkeys",
		event = "VeryLazy", -- Load after startup
		opts = {
			position = "bottom-right",
			maxkeys = 6,
			show_count = true,
			winopts = {
				focusable = false,
				relative = "editor",
				style = "minimal",
				border = "single",
				height = 1,
				row = 1,
				col = 0,
			},
		},
		config = function(_, opts)
			require("showkeys").setup(opts)
			vim.cmd("ShowkeysToggle")
		end,
	},
}
