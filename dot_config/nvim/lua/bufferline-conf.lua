local fn = vim.fn
require("bufferline").setup{
    options = {
        name_formatter = function(buf)
            return fn.pathshorten(buf.path)
        end,
        sort_by = "id",
        separator_style = "slant"
    }
}

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
vim.api.nvim_set_keymap('n', 'gp', ':BufferLinePick<CR>', opts)
