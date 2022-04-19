local opts = { noremap = true }
local keymapset = vim.keymap.set
-- Normal mode
keymapset('n', '<leader>l', '$', opts)
keymapset('n', '<leader>h', '^', opts)
keymapset('n', '<leader>n', ':nohlsearch<CR>', opts)
keymapset('n', '<leader>T', ':tabnew<Space>', opts)
keymapset('n', '<leader>W', ':tabclose<CR>', opts)
keymapset('n', '<leader>y', 'y$', opts)
keymapset('n', '<leader>d', 'D', opts)
keymapset('n', '<leader>s', [[:%s//gc<Left><Left><Left>]], opts)
keymapset('n', '<leader><leader>', '<C-^>', opts)
keymapset('n', '<leader>R', ':e $MYVIMRC<CR>', opts)
-- keymapset('n', '<leader>s', ':split<Space>', opts)
-- keymapset('n', '<leader>v', ':vsplit<Space>', opts)
keymapset('n', '<C-Left>', ':vertical resize +3<CR>', {noremap = true, silent = true})
keymapset('n', '<C-Right>', ':vertical resize -3<CR>', {noremap = true, silent = true})
keymapset('n', '<S-C-Up>', ':resize +3<CR>', {noremap = true, silent = true})
keymapset('n', '<S-C-Down>', ':resize -3<CR>', {noremap = true, silent = true})
keymapset('n', '<C-h>', '<C-w>h', opts)
keymapset('n', '<C-j>', '<C-w>j', opts)
keymapset('n', '<C-k>', '<C-w>k', opts)
keymapset('n', '<C-l>', '<C-w>l', opts)

-- Visual mode
-- https://vim.fandom.com/wiki/Shifting_blocks_visually
keymapset('v', '<leader>y', [[<Esc>'<0v'>g_y]], opts)
keymapset('v', '>', '>gv', opts)
keymapset('v', '<', '<gv', opts)

-- Better help
vim.cmd([[
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
]])

-- Global
-- My compile and run script
vim.g.asyncrun_open = 6
vim.cmd([[
autocmd FileType tex let g:asyncrun_open = 0
]])
vim.keymap.set('', '<leader>r', [[:w! | AsyncRun candrun <c-r>%<CR>]], {})
vim.keymap.set('', '<leader>m', [[:wa | TermExec cmd="detectmake"<CR>]], {})

vim.keymap.set('n', [[<leader>\]], ':NvimTreeToggle<CR>', {})
vim.api.nvim_create_user_command('ReloadConfig', require('utils').conf_reload, { force = true })

