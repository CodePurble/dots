set nocompatible
lua require('plugins')

" My COC EXTENSIONS (not used anymore, here just for reference)
" Show with    :CocList extensions
" Install with :CocInstall <extension>
" ------------------
"  coc-pyright
"  coc-json
"  coc-clangd
"  coc-rust-analyzer

" vimscript config files
source $HOME/.config/nvim/config-plugins/general-conf.vim
source $HOME/.config/nvim/config-plugins/onedark-theme.vim
source $HOME/.config/nvim/config-plugins/templates-conf.vim
source $HOME/.config/nvim/config-plugins/asciidoctor-conf.vim
source $HOME/.config/nvim/config-plugins/nerdcomment-conf.vim
source $HOME/.config/nvim/config-plugins/autoformat-conf.vim
source $HOME/.config/nvim/config-plugins/tablemode-conf.vim
source $HOME/.config/nvim/config-plugins/hexokinase-conf.vim
source $HOME/.config/nvim/config-plugins/sneak-conf.vim
source $HOME/.config/nvim/config-plugins/keys-conf.vim

" lua
lua require('lsp-conf')
lua require('treesitter-conf')
lua require('lualine-conf')
lua require('bufferline-conf')
lua require('toggleterm-conf')
lua require('kommentary-config')
" luafile $HOME/.config/nvim/lua/lsp-conf.lua
" luafile $HOME/.config/nvim/lua/treesitter-conf.lua
" luafile $HOME/.config/nvim/lua/lualine-conf.lua
" luafile $HOME/.config/nvim/lua/bufferline-conf.lua
" luafile $HOME/.config/nvim/lua/toggleterm-conf.lua

let g:tex_flavor = "latex"

" Source init.vim whenever it is written to
" au! BufWritePost $MYVIMRC source $MYVIMRC
au! BufWritePost plugins.lua source $MYVIMRC

" indent guides
" let g:indent_blankline_char = '»'
let g:indent_blankline_char = '⏐'
let g:indent_blankline_filetype_exclude = ['help', 'nerdtree', 'packer']
let g:indent_blankline_buftype_exclude = ['terminal']
highlight IndentBlanklineChar guibg=#323944 guifg=#272b30 gui=nocombine

" selectively use tabs instead of spaces
au Filetype make,gitcommit,gitconfig set noexpandtab
" au Filetype make,gitcommit,gitconfig set listchars=space:·,tab:·
" au Filetype make,gitcommit,gitconfig let g:indent_blankline_char = ''
au Filetype make,gitcommit,gitconfig set listchars=space:·,tab:⭾·
au Filetype make,gitcommit,gitconfig let g:indent_blankline_char = '⭾'

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Tagbar
nmap <F8> :TagbarToggle<CR>

" vim-cpp-modern
" let g:cpp_attributes_highlight = 1
" let g:cpp_member_highlight = 1

" vim-lsp-cxx-highlight
" let g:lsp_cxx_hl_use_text_props = 1
" let g:lsp_cxx_hl_log_file = '/tmp/lsp-cxx-hl.log'
" let g:lsp_cxx_hl_verbose_log = 1
