local fn = vim.fn
local path = require("plenary.path")
require("bufferline").setup{
    options = {
        name_formatter = function(buf)
            -- Hack to get the filepath relative to cwd
            return fn.pathshorten(path:new(buf.path):make_relative(vim.fn.getcwd()))
            -- return path:new(buf.path):make_relative(vim.fn.getcwd())
        end,
        sort_by = "id",
        separator_style = "slant",
        numbers = function(opts)
            return string.format('%s', opts.raise(opts.id))
        end
    }
}

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
vim.api.nvim_set_keymap('n', 'gp', ':BufferLinePick<CR>', opts)
