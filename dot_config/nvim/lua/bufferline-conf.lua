require("bufferline").setup{}

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', 'gt', ':BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', 'gT', ':BufferLineCyclePrev<CR>', opts)
vim.api.nvim_set_keymap('n', 'gp', ':BufferLinePick<CR>', opts)
