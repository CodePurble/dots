require("gitsigns").setup({
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end
        local opts = {noremap = true}
        map('n', '<leader>us', gs.stage_hunk(), opts)
        map('v', '<leader>us', gs.stage_hunk({vim.fn.line("."), vim.fn.line("v")}), opts)
        map('n', '<leader>uu', gs.undo_stage_hunk(), opts)
        map('n', '<leader>ur', gs.reset_hunk(), opts)
        map('v', '<leader>ur', gs.reset_hunk({vim.fn.line("."), vim.fn.line("v")}), opts)
        map('n', '<leader>uR', gs.reset_buffer(), opts)
        map('n', '<leader>up', gs.preview_hunk(), opts)
        map('n', '<leader>ub', gs.blame_line(true), opts)
    end,
})
