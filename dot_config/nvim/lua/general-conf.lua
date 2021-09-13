vim.g.mapleader = " "
vim.opt.encoding = "utf-8"
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.hidden = true
-- vim.opt.concealcursor = "nc"
vim.opt.conceallevel = 2
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.textwidth = 0
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- listchars
vim.opt.list = true

-----------------
-- Indentation --
-----------------
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- tabs
-- vim.opt.expandtab = false
-- set listchars=space:·,tab:»· " DON'T SET EXPANDTAB IF YOU WANT TO SET THE tab LISTCHAR

-- spaces
vim.opt.expandtab = true
vim.opt.listchars = {space = "·"}
vim.opt.clipboard = "unnamedplus"-- Make nvim use the system clipboard
vim.opt.nrformats = "alpha"-- Make nvim use the system clipboard
vim.opt.mouse = "a" -- enable mouse
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.formatoptions = vim.opt.formatoptions - "o" + "r" + "c" + "q"

-- https://github.com/lukas-reineke/indent-blankline.nvim/issues/59#issuecomment-806398054
vim.wo.colorcolumn = "99999"
