local keymap = vim.api.nvim_set_keymap
vim.cmd([[let g:sneak#label = 1]])
keymap('', 'f', '<Plug>Sneak_s', {})
keymap('', 'F', '<Plug>Sneak_S', {})
keymap('', 't', '<Plug>Sneak_t', {})
keymap('', 'T', '<Plug>Sneak_T', {})

