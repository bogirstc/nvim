return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gp", "<cmd>:Gitsigns preview_hunk<CR>")
			vim.keymap.set("n", "<leader>gt", "<cmd>:Gitsigns toggle_current_line_blame<CR>")
			vim.keymap.set("n", "<leader>gs", "<cmd>:Gitsigns stage_hunk<CR>")
			vim.keymap.set("n", "<leader>gs", "<cmd>:G status<CR>")
			vim.keymap.set("n", "<leader>gd", "<cmd>:G diff<CR>")
			vim.keymap.set("n", "<leader>ga", "<cmd>:G add %<CR>")
		end,
	},
	{ "tpope/vim-fugitive" },
}
