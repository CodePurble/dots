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
luafile $HOME/.config/nvim/lua/lsp-conf.lua
luafile $HOME/.config/nvim/lua/treesitter-conf.lua
luafile $HOME/.config/nvim/lua/lualine-conf.lua
luafile $HOME/.config/nvim/lua/bufferline-conf.lua
luafile $HOME/.config/nvim/lua/toggleterm-conf.lua

let g:tex_flavor = "latex"

" Source init.vim whenever it is written to
" au! BufWritePost $MYVIMRC source $MYVIMRC
au! BufWritePost plugins.lua source $MYVIMRC

" vim-anyfold
" autocmd Filetype * AnyFoldActivate
" set foldlevel=99 " Open all folds

" selectively use tabs instead of spaces
au Filetype make,gitcommit,gitconfig set noexpandtab
au Filetype make,gitcommit,gitconfig set listchars=space:·,tab:»·

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_tab_guides = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'make', 'packer', 'gitcommit', 'gitconfig']

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
