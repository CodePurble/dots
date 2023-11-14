-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-----------------
-- Indentation --
-----------------
vim.opt.autoindent = true
vim.opt.smarttab = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- tabs
-- vim.opt.expandtab = false
-- vim.opt.listchars = { tab = "»·", space = "·" } DON'T SET EXPANDTAB IF YOU WANT TO SET THE tab LISTCHAR

-- spaces
vim.opt.expandtab = true
-- vim.opt.listchars = { space = "·" }
vim.opt.clipboard = "unnamedplus" -- Make nvim use the system clipboard
vim.opt.nrformats = "alpha"
vim.opt.mouse = "a" -- enable mouse
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.formatoptions = vim.opt.formatoptions - "o" + "r" + "c" + "q"

-- Better help
local autocmd = vim.api.nvim_create_autocmd
local help = vim.api.nvim_create_augroup("HelpOpts", { clear = true })
autocmd("FileType", { pattern = "help", command = "nnoremap <buffer> <CR> <C-]>", group = help })
autocmd("FileType", { pattern = "help", command = "nnoremap <buffer> <BS> <C-T>", group = help })
autocmd("FileType", { pattern = "help", command = [[nnoremap <buffer> o /'\l\{2,\}' <CR>]], group = help })
autocmd("FileType", { pattern = "help", command = [[nnoremap <buffer> O ?'\l\{2,\}' <CR>]], group = help })
autocmd("FileType", { pattern = "help", command = [[nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>]], group = help })
autocmd("FileType", { pattern = "help", command = [[nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>]], group = help })

-- Global
-- My compile and run script
vim.g.asyncrun_open = 6
autocmd("FileType", { pattern = "tex", command = [[let g:asyncrun_open = 0]] })
