let g:formatdef_custom_cpp = '"astyle --style=stroustrup --indent=spaces=4 --attach-closing-while --add-braces"'
let g:formatters_cpp = ['custom_cpp']
let g:formatdef_custom_c = '"astyle --style=stroustrup --indent=spaces=4 --attach-closing-while --add-braces"'
let g:formatters_c = ['custom_c']
noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat
" let g:autoformat_verbosemode=1 " Uncomment for verbose output on formatting
