-- Basic options for keymaps: no remapping, silent execution
local opts = { noremap = true, silent = true }

-- Set leader and local leader keys to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "open file explorer (netrw)" })
vim.keymap.set("n", "<leader>vs", "<cmd>:vsplit<CR>zz", { desc = "split window vertically and center" })

-- Visual mode line movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected lines up" })

-- Smarter vertical movement (handle wrapped lines)
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Join lines while keeping cursor position
vim.keymap.set("n", "J", "mzJ`z", { desc = "join lines without moving cursor" })

-- Half-page navigation with cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll up and center cursor" })

-- Buffer navigation
vim.keymap.set("n", "<leader>-", "<cmd>bprevious<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>=", "<cmd>bnext<CR>", { desc = "next buffer" })

-- Keep search results centered
vim.keymap.set("n", "n", "nzzzv", { desc = "next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "previous search result (centered)" })

-- Keep visual selection when indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Escape insert mode with Ctrl+C (alternative to Esc)
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "exit insert mode" })

-- Clear search highlights
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "clear search highlights" })

-- Format buffer using LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "format buffer with LSP" })

-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>", { desc = "disable Ex mode" })

-- Delete without affecting registers
vim.keymap.set("n", "x", '"_x', { desc = "delete character without copying", silent = true })

-- Global word replacement using the word under cursor
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "replace word under cursor globally" }
)

vim.keymap.set("n", "<C-w>m", "<C-w>_", { desc = "maximize current window vertically" })

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "make file executable", silent = true })

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight yanked text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- TermOpen autocmd
vim.api.nvim_create_autocmd("TermOpen", {
	desc = "set terminal options",
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- Open a new terminal in a horizontal split at the bottom
vim.keymap.set("n", "<C-t><C-t>", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
end, { desc = "open a new terminal" })

-- Clear whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current file in new tab" })

-- Split window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "equalize window sizes" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split" })

-- Copy current file path to clipboard
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "copy current file path to clipboard" })
