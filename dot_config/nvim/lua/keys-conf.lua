local opts = {noremap = true}
local keymap = vim.api.nvim_set_keymap
-- Normal mode
keymap('n', '<leader>l', '$', opts)
keymap('n', '<leader>h', '^', opts)
keymap('n', '<leader>n', ':nohlsearch<CR>', opts)
keymap('n', '<leader>T', ':tabnew<Space>', opts)
keymap('n', '<leader>W', ':tabclose<CR>', opts)
keymap('n', '<leader>y', 'y$', opts)
keymap('n', '<leader>d', 'D', opts)
keymap('n', 'S', [[:%s//gc<Left><Left><Left>]], opts)
keymap('n', '<leader><leader>', '<C-^>', opts)
keymap('n', '<leader>R', ':e $MYVIMRC<CR>', opts)
keymap('n', '<leader>s', ':split<Space>', opts)
keymap('n', '<leader>v', ':vsplit<Space>', opts)
keymap('n', '<C-Left>', ':vertical resize +3<CR>', {noremap = true, silent = true})
keymap('n', '<C-Right>', ':vertical resize -3<CR>', {noremap = true, silent = true})
keymap('n', '<S-C-Up>', ':resize +3<CR>', {noremap = true, silent = true})
keymap('n', '<S-C-Down>', ':resize -3<CR>', {noremap = true, silent = true})
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Visual mode
-- https://vim.fandom.com/wiki/Shifting_blocks_visually
keymap('v', '<leader>y', [[<Esc>'<0v'>g_y]], opts)
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

-- Better help navigation
vim.cmd([[
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
]])

" Global
" My compile and run script
keymap('', '<leader>r', [[:w! \| AsyncRun candrun <c-r>%<CR>]])
keymap('', '<leader>m', [[:TermExec cmd="detectmake"<CR>]])

