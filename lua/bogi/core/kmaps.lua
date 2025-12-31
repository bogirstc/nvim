local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", "<cmd>:Oil<CR>", opts, { desc = "open file explorer (oil)" })
vim.keymap.set("n", "-", "<cmd>:Oil<CR>", { desc = "open file explorer (oil)" })
vim.keymap.set("n", "<leader>vs", "<cmd>:vsplit<CR>zz", { desc = "split window vertically and center" })
vim.keymap.set("n", "<leader>nc", "<cmd>tabnew<CR><cmd>:Oil ~/.config/nvim<CR>", { desc = "open nvim config dir" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected lines up" })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "J", "mzJ`z", { desc = "join lines without moving cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll up and center cursor" })

vim.keymap.set("n", "<leader>-", "<cmd>bprevious<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>=", "<cmd>bnext<CR>", { desc = "next buffer" })

vim.keymap.set("n", "n", "nzzzv", { desc = "next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "previous search result (centered)" })

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "exit insert mode" })
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "clear search highlights" })
vim.keymap.set("n", "Q", "<nop>", { desc = "disable exit mode" })
vim.keymap.set("n", "<C-q>", "<nop>", { desc = "disable visual block mode" })

vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", {
	desc = "restart lsp",
	silent = true,
})

vim.keymap.set("n", "x", '"_x', { desc = "delete character without copying", silent = true })
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "replace word under cursor globally" }
)
-- note: the cursor must be on the word you want to replace when entering visual mode.
vim.keymap.set(
	"v",
	"<leader>s",
	[[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "replace word under cursor in selection" }
)

vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { desc = "make file executable", silent = true })

vim.keymap.set("n", "<leader>t", "<cmd>tabnew %<CR>", { desc = "open current file in new tab" })
vim.keymap.set("n", "<leader>l", "<cmd>tabn<CR>", { desc = "next tab" })
vim.keymap.set("n", "<leader>h", "<cmd>tabp<CR>", { desc = "previous tab" })
vim.keymap.set("n", "<leader>q", "<cmd>tabclose<CR>", { desc = "close tab" })
vim.keymap.set("n", "<leader>m", "<C-w>_", { desc = "maximize current split" })
vim.keymap.set("n", "<leader>e", "<C-w>=", { desc = "equalize all splits" })

vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "leave term mode", silent = true })
vim.keymap.set("n", "<C-->", "<C-w>-", { desc = "decrease split size" })
vim.keymap.set("n", "<C-=>", "<C-w>+", { desc = "increase split size" })

vim.keymap.set("n", "<C-.>", "<cmd>:cnext<CR>", { desc = "quickfix next" })
vim.keymap.set("n", "<C-,>", "<cmd>:cprev<CR>", { desc = "quickfix previous" })

vim.keymap.set(
	"t",
	"<C-w><C-w>",
	"<C-\\><C-n><C-w><C-w>",
	{ desc = "leave term mode and switch to next split", silent = true }
)
vim.keymap.set("n", "<C-t><C-t>", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
end, { desc = "open a new terminal" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight yanked text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("TermOpen", {
	desc = "set terminal options",
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})
