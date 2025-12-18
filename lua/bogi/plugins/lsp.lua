return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.keymap.set(
						"n",
						"gD",
						vim.lsp.buf.declaration,
						{ desc = "lsp declaration", buffer = ev.buf, silent = true }
					)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
						desc = "lsp rename",
						buffer = ev.buf,
						silent = true,
					})
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
						desc = "line diagnostics",
						buffer = ev.buf,
						silent = true,
					})
					vim.keymap.set("n", "K", vim.lsp.buf.hover, {
						desc = "lsp hover",
						buffer = ev.buf,
						silent = true,
					})
					vim.keymap.set(
						"n",
						"<leader>f",
						vim.lsp.buf.format,
						{ desc = "format buffer with LSP", buffer = ev.buf, silent = true }
					)
					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end)
				end,
			})

			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
				filetypes = { "sh", "bash" },
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.terraformls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
				vim.lsp.enable("lua_ls"),
				vim.lsp.enable("gopls"),
			})
		end,
	},
}
