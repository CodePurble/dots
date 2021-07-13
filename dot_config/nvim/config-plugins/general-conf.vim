syntax enable
filetype plugin indent on

set encoding=utf-8
set background=dark

if (has("termguicolors"))
    set termguicolors
endif

set hidden

set concealcursor="nvi"
set conceallevel=2

let mapleader = " "
set nowrap
set cursorline
set number relativenumber " Show hybrid line numbers
" set linebreak " Break lines at word (requires Wrap lines)
" set showbreak=+++ " Wrap-broken line prefix
set textwidth=0 " Line wrap (number of cols)
set showmatch " Highlight matching brace

set hlsearch " Highlight all search results
set smartcase " Enable smart-case search
set incsearch " Searches for strings incrementally

" listchars
set list

" ----------- "
" Indentation "
" ----------- "
set autoindent " Auto-indent new lines
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

" tabs
" set noexpandtab
" set listchars=space:·,tab:»· " DON'T SET EXPANDTAB IF YOU WANT TO SET THE tab LISTCHAR

" spaces
set expandtab
set listchars=space:·

set nrformats+=alpha

" Make nvim use the system clipboard
set clipboard+=unnamedplus
" Enable mouse
set mouse=a
set splitright splitbelow
