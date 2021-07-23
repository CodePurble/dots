vim.g.asciidoctor_use_fullpath = false
vim.g.asciidoctor_executable = 'docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor asciidoctor'
vim.g.asciidoctor_pdf_executable = 'docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf'
vim.g.asciidoctor_syntax_conceal = 1
vim.g.asciidoctor_fenced_languages = {'python', 'c', 'cpp', 'verilog', 'octave'}
vim.g.asciidoctor_pdf_extensions = {'asciidoctor-mathematical'}
vim.g.asciidoctor_img_paste_command = 'xclip -selection clipboard -t image/png -o > %s%s'

vim.cmd([[
fun! AsciidoctorMappings()
    nnoremap <buffer> <leader>oo :w! \| :AsciidoctorOpenRAW<CR>
    nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
    nnoremap <buffer> <leader>r :w! \| :Asciidoctor2PDF<CR>
    nnoremap <buffer> <leader>p :AsciidoctorPasteImage<CR>
    " nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
    " nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
    " nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
    " nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
endfun

-- Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
    au!
    au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END
]])

