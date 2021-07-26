require('gitsigns').setup {
    keymaps = {
        noremap = true,
        ['n <leader>us'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ['v <leader>us'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n <leader>uu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ['n <leader>ur'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ['v <leader>ur'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n <leader>uR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ['n <leader>up'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ['n <leader>ub'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    }
}

