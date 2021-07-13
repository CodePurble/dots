if has("autocmd")
    augroup templates
        autocmd BufNewFile *.sh 0r ~/.dotfiles/templates/template.sh
        autocmd BufNewFile *.zsh 0r ~/.dotfiles/templates/template.zsh
        autocmd BufNewFile *.py 0r ~/.dotfiles/templates/template.py
        autocmd BufNewFile *.md 0r ~/.dotfiles/templates/template.md
        autocmd BufNewFile *.s 0r ~/.dotfiles/templates/template.s
        autocmd BufNewFile *.adoc 0r ~/.dotfiles/templates/template.adoc
        autocmd BufNewFile *.c 0r ~/.dotfiles/templates/template.c
        autocmd BufNewFile *.cc 0r ~/.dotfiles/templates/template.cc
        autocmd BufNewFile *.tex 0r ~/.dotfiles/templates/template.tex
    augroup END
endif

autocmd FileType tex,latex,markdown setlocal spell spelllang=en_gb
autocmd BufEnter *.pio set filetype=asm " RP2040 pioasm files

