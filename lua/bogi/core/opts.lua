-- Cursor settings
vim.opt.guicursor = "" -- use block cursor in all modes

-- Line numbers
vim.opt.nu = true -- show absolute line numbers
vim.opt.relativenumber = true -- show relative line numbers

-- Tab and indentation settings
vim.opt.tabstop = 4 -- number of spaces a tab counts for
vim.opt.softtabstop = 4 -- number of spaces for editing operations
vim.opt.shiftwidth = 4 -- number of spaces to use for autoindent
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.smartindent = true -- smart autoindenting for code
vim.opt.breakindent = true -- preserve indentation in wrapped lines
vim.opt.wrap = false -- disable line wrapping

-- File handling
vim.opt.swapfile = false -- disable swap file
vim.opt.backup = false -- disable backup file
vim.opt.undofile = true -- enable persistent undo

-- Search settings
vim.opt.incsearch = true -- show matches while typing
vim.opt.inccommand = "split" -- show substitution results in a split
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- use case-sensitive search if uppercase is used

-- Appearance
vim.opt.termguicolors = true -- enable true color support
vim.opt.background = "dark" -- use dark background
vim.opt.scrolloff = 8 -- minimum lines above/below cursor
vim.opt.signcolumn = "yes" -- always show sign column

-- Editing behavior
vim.opt.backspace = { "start", "eol", "indent" } -- allow backspace over these
vim.opt.splitright = true -- vertical splits open to the right
vim.opt.splitbelow = true -- horizontal splits open below

-- File and performance tweaks
vim.opt.isfname:append("@-@") -- allow '@' in file names
vim.opt.updatetime = 50 -- faster update time for events (like CursorHold)
vim.opt.colorcolumn = "80" -- highlight column 80 as a visual guide

-- Completion and clipboard
vim.opt.completeopt = "menuone,noselect" -- completion menu behavior
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.hlsearch = true -- highlight search results

-- Mouse support
vim.opt.mouse = "a" -- enable mouse in all modes

-- EditorConfig
vim.g.editorconfig = true -- enable .editorconfig support

-- Netrw settings
vim.cmd("let g:netrw_banner = 0") -- disable netrw banner
