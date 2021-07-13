if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly=''
let g:python_recommended_style=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2

" AsyncRun
" https://github.com/vim-airline/vim-airline/wiki/Configuration-Examples-and-Snippets#dynamically-change-accent-of-a-vim-airline-section-requires-asyncrun
function! AirlineThemePatch(palette)
    " [ guifg, guibg, ctermfg, ctermbg, opts ].
    " See "help attr-list" for valid values for the "opt" value.
    " http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
    let a:palette.accents.running = [ '', '', '', '', '' ]
    let a:palette.accents.success = [ '#00ff00', '' , 'green', '', '' ]
    let a:palette.accents.failure = [ '#ff0000', '' , 'red', '', '' ]
endfunction
let g:airline_theme_patch_func = 'AirlineThemePatch'

"" Change color of the relevant section according to g:asyncrun_status, a global variable exposed by AsyncRun
"" 'running': default, 'success': green, 'failure': red
let g:async_status_old = ''
function! Get_asyncrun_running()

    let async_status = g:asyncrun_status
    if async_status != g:async_status_old

        if async_status == 'running'
            call airline#parts#define_accent('asyncrun_status', 'running')
        elseif async_status == 'success'
            call airline#parts#define_accent('asyncrun_status', 'success')
        elseif async_status == 'failure'
            call airline#parts#define_accent('asyncrun_status', 'failure')
        endif

        " do not remove the filetype from airline. With this array, display
        " status <space> filetype
        let g:airline_section_x = airline#section#create(['asyncrun_status', ' ', 'filetype'])
        AirlineRefresh
        let g:async_status_old = async_status

    endif

    return async_status

endfunction

call airline#parts#define_function('asyncrun_status', 'Get_asyncrun_running')
let g:airline_section_x = airline#section#create(['asyncrun_status', ' ', 'filetype'])
