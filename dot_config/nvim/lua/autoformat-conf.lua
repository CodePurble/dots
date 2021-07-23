vim.g.formatdef_custom_cpp = '"astyle --style=stroustrup --indent=spaces=4 --attach-closing-while --add-braces"'
vim.g.formatters_cpp = {'custom_cpp'}
vim.g.formatdef_custom_c = '"astyle --style=stroustrup --indent=spaces=4 --attach-closing-while --add-braces"'
vim.g.formatters_c = {'custom_c'}
vim.api.nvim_buf_set_keymap('', '<F3>', ':Autoformat<CR>', {noremap = true})
-- vim.g.autoformat_verbosemode = true -- Uncomment for verbose output on formatting
