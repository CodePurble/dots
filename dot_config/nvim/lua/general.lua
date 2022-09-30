vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h9"
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
vim.opt.laststatus = 3 -- Single global satusline

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
-- vim.opt.listchars = { tab = "»·", space = "·" } DON'T SET EXPANDTAB IF YOU WANT TO SET THE tab LISTCHAR

-- spaces
vim.opt.expandtab = true
vim.opt.listchars = { space = "·" }
vim.opt.clipboard = "unnamedplus"-- Make nvim use the system clipboard
vim.opt.nrformats = "alpha"
vim.opt.mouse = "a" -- enable mouse
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.formatoptions = vim.opt.formatoptions - "o" + "r" + "c" + "q"

-- https://github.com/lukas-reineke/indent-blankline.nvim/issues/59#issuecomment-806398054
vim.wo.colorcolumn = "99999"

local default_plugins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "syntax",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(default_plugins) do
   vim.g["loaded_" .. plugin] = 1
end
