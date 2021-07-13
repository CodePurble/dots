require("bufferline").setup{}

vim.api.nvim_set_keymap('n', 'gt', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gT', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gp', ':BufferLinePick<CR>', {noremap = true, silent = true})
