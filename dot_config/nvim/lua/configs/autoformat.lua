vim.g.python3_host_prog = "/usr/bin/python"

vim.g.formatdef_custom_cpp = [["astyle --style=stroustrup --indent=spaces=4 --attach-closing-while --add-braces"]]
vim.g.formatdef_custom_c = [["astyle --style=stroustrup --indent=spaces=4 --attach-closing-while --add-braces"]]
vim.g.formatdef_custom_tex = [["latexindent --yaml=defaultIndent:'    '"]]

vim.g.formatters_python = {'black'}
vim.g.formatters_cpp = {'custom_cpp'}
vim.g.formatters_c = {'custom_c'}
vim.g.formatters_tex = {'custom_tex'}

vim.api.nvim_set_keymap('', '<F3>', ':Autoformat<CR>', {noremap = true})
-- vim.cmd([[let g:autoformat_verbosemode = 1]]) -- Uncomment for verbose output on formatting
