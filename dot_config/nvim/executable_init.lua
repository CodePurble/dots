vim.opt.compatible = false
require('plugins')

-- My COC EXTENSIONS (not used anymore, here just for reference)
-- Show with    :CocList extensions
-- Install with :CocInstall <extension>
-- ------------------
--  coc-pyright
--  coc-json
--  coc-clangd
--  coc-rust-analyzer

-- vimscript config files
require('general-conf')
require('onedark-theme')
require('templates-conf')
require('asciidoctor-conf')
require('autoformat-conf')
require('tablemode-conf')
require('sneak-conf')
require('keys-conf')
require('lsp-conf')
require('compe-conf')
require('treesitter-conf')
require('lualine-conf')
require('bufferline-conf')
require('toggleterm-conf')
require('kommentary-conf')
require("todo-comments").setup()

vim.g.tex_flavor = 'latex'

-- Source init.vim whenever it is written to
-- au! BufWritePost $MYVIMRC source $MYVIMRC
-- au! BufWritePost plugins.lua source $MYVIMRC

-- indent guides
-- let g:indent_blankline_char = '»'
vim.g.indent_blankline_char = '|'
vim.g.indent_blankline_filetype_exclude = {'help', 'nerdtree', 'packer'}
vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.cmd('highlight IndentBlanklineChar guibg=#323944 guifg=#272b30 gui=nocombine')

-- selectively use tabs instead of spaces
vim.cmd('au Filetype make,gitcommit,gitconfig set noexpandtab')
-- vim.cmd([[au Filetype make,gitcommit,gitconfig set listchars=space:·,tab:]])
-- vim.cmd([[au Filetype make,gitcommit,gitconfig let g:indent_blankline_char = '']])
vim.cmd([[au Filetype make,gitcommit,gitconfig set listchars=space:·,tab:⭾]])
vim.cmd([[au Filetype make,gitcommit,gitconfig let g:indent_blankline_char = '⭾']])

-- Remove trailing whitespaces on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
