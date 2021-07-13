if has("autocmd")
    augroup templates
        autocmd BufNewFile *.sh 0r ~/.config/templates/template.sh
        autocmd BufNewFile *.zsh 0r ~/.config/templates/template.zsh
        autocmd BufNewFile *.py 0r ~/.config/templates/template.py
        autocmd BufNewFile *.md 0r ~/.config/templates/template.md
        autocmd BufNewFile *.s 0r ~/.config/templates/template.s
        autocmd BufNewFile *.adoc 0r ~/.config/templates/template.adoc
        autocmd BufNewFile *.c 0r ~/.config/templates/template.c
        autocmd BufNewFile *.cc 0r ~/.config/templates/template.cc
        autocmd BufNewFile *.tex 0r ~/.config/templates/template.tex
    augroup END
endif

autocmd FileType tex,latex,markdown setlocal spell spelllang=en_gb
autocmd BufEnter *.pio set filetype=asm " RP2040 pioasm files

