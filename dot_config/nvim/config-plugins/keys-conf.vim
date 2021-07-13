" Normal mode
nnoremap <leader>l $
nnoremap <leader>h ^
nnoremap <leader>n :nohlsearch<CR>
nnoremap <leader>T :tabnew<Space>
nnoremap <leader>W :tabclose<CR>
nnoremap <leader>y y$
nnoremap <leader>d D
nnoremap <leader>c C
nnoremap S :%s//gc<Left><Left><Left>
nnoremap <leader><leader> <C-^>
nnoremap <leader>R :e $MYVIMRC<CR>
nnoremap <leader>s :split<Space>
nnoremap <leader>v :vsplit<Space>
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <S-C-Up> :resize +3<CR>
nnoremap <silent> <S-C-Down> :resize -3<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Visual mode
" https://vim.fandom.com/wiki/Shifting_blocks_visually
vnoremap <leader>y <Esc>'<0v'>g_y
vnoremap > >gv
vnoremap < <gv

" Better help navigation
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>

" Global
" My compile and run script
map <leader>r :w! \| AsyncRun candrun <c-r>%<CR>
map <leader>m :TermExec cmd="detectmake"<CR>

