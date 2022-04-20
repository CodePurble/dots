local autocmd = vim.api.nvim_create_autocmd
local templates = vim.api.nvim_create_augroup("TemplatesGroup", { clear = true })

autocmd("BufNewFile", { pattern = "*.sh", command = "0r ~/.config/templates/template.sh", group = templates })
autocmd("BufNewFile", { pattern = "*.zsh", command = "0r ~/.config/templates/template.zsh", group = templates })
autocmd("BufNewFile", { pattern = "*.py", command = "0r ~/.config/templates/template.py", group = templates })
autocmd("BufNewFile", { pattern = "*.md", command = "0r ~/.config/templates/template.md", group = templates })
autocmd("BufNewFile", { pattern = "*.s", command = "0r ~/.config/templates/template.s", group = templates })
autocmd("BufNewFile", { pattern = "*.adoc", command = "0r ~/.config/templates/template.adoc", group = templates })
autocmd("BufNewFile", { pattern = "*.c", command = "0r ~/.config/templates/template.c", group = templates })
autocmd("BufNewFile", { pattern = "*.cc", command = "0r ~/.config/templates/template.cc", group = templates })
autocmd("BufNewFile", { pattern = "*.tex", command = "0r ~/.config/templates/template.tex", group = templates })
autocmd("FileType", { pattern = "tex,latex,markdown", command = "setlocal spell spelllang=en_gb" })
