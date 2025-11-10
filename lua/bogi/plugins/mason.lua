return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		mason.setup({
			ui = {
				icons = {
					package_installed = "o",
					package_pending = "...",
					package_uninstalled = "x",
				},
			},
		})
		mason_lspconfig.setup({
			automatic_enable = false,
			ensure_installed = {
				"bashls",
				"dockerls",
				"docker_compose_language_service",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"terraformls",
				"ts_ls",
				"yamlls",
				"lua_ls",
				"html",
				"cssls",
				"gopls",
				"emmet_ls",
				"emmet_language_server",
				"marksman",
			},
		})
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"pylint",
				"clangd",
			},
		})
	end,
}
