return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 30
				elseif term.direction == "vertical" then
					return 0.3
				end
			end,
			direction = "horizontal",
			autochdir = true,
			shade_terminals = true,
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		-- Key mappings for ToggleTerm
		vim.keymap.set({ "n", "t" }, "<c-t><c-t>", '<cmd>:ToggleTerm direction="float" size=70<CR>')
		vim.keymap.set("n", "<c-t><c-v>", '<cmd>:ToggleTerm direction="vertical" size=70<CR>')
		vim.keymap.set("n", "<c-t><c-h>", '<cmd>:ToggleTerm direction="horizontal"<CR>')
		vim.keymap.set("n", "<c-t><c-f>", '<cmd>:ToggleTerm direction="float" size=70<CR>')
		vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = 0 })
	end,
}
