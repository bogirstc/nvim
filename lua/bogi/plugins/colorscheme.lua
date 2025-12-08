-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	name = "kanagawa",
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			compile = false,
-- 			undercurl = true,
-- 			commentStyle = { italic = true },
-- 			functionStyle = {},
-- 			keywordStyle = { italic = true },
-- 			statementStyle = { bold = true },
-- 			typeStyle = {},
-- 			transparent = true,
-- 			dimInactive = false,
-- 			terminalColors = true,
-- 			colors = {
-- 				palette = {},
-- 				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
-- 			},
-- 			overrides = function(colors) -- add/modify highlights
-- 				return {
-- 					SignColumn = { bg = "none" },
-- 					LineNr = { bg = "none" },
-- 					CursorLineNr = { bg = "none" },
-- 					FoldColumn = { bg = "none" },
-- 				}
-- 			end,
-- 			theme = "wave", -- Load "wave" theme
-- 			background = { -- map the value of 'background' option to a theme
-- 				dark = "wave", -- try "dragon" !
-- 				light = "lotus",
-- 			},
-- 		})
--
-- 		-- setup must be called before loading
-- 		vim.cmd("colorscheme kanagawa")
-- 	end,
-- }
-- return {
-- 	"blazkowolf/gruber-darker.nvim",
-- 	name = "gruber-darker",
-- 	config = function()
-- 		require("gruber-darker").setup({
-- 			bold = false,
-- 			invert = {
-- 				signs = false,
-- 				tabline = false,
-- 				visual = false,
-- 			},
-- 			italic = {
-- 				strings = false,
-- 				comments = true,
-- 				operators = false,
-- 				folds = false,
-- 			},
-- 			undercurl = true,
-- 			underline = true,
-- 		})
-- 		vim.cmd("colorscheme gruber-darker")
-- 	end,
-- }
return {
	"thimc/gruber-darker.nvim",
	config = function()
		require("gruber-darker").setup({
			-- OPTIONAL
			transparent = false, -- removes the background
			-- underline = false, -- disables underline fonts
			-- bold = false, -- disables bold fonts
		})
		vim.cmd.colorscheme("gruber-darker")
	end,
}
