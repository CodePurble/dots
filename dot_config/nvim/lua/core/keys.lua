local opts = { noremap = true }
local keymapset = vim.keymap.set

-- Normal mode
keymapset({ "n", "v" }, "<leader>l", "$", opts)
keymapset({ "n", "v" }, "<leader>h", "^", opts)
keymapset("n", "<leader>n", ":nohlsearch<CR>", opts)
keymapset("n", "<leader>T", ":tabnew<Space>", opts)
keymapset("n", "<leader>W", ":tabclose<CR>", opts)
keymapset("n", "<leader>y", "y$", opts)
keymapset("n", "<leader>d", "D", opts)
keymapset("n", "<leader>s", [[:%s//gc<Left><Left><Left>]], opts)
keymapset("n", "<leader><leader>", "<C-^>", opts)
-- keymapset('n', '<leader>s', ':split<Space>', opts)
-- keymapset('n', '<leader>v', ':vsplit<Space>', opts)
keymapset("n", "<C-Left>", ":vertical resize +3<CR>", { noremap = true, silent = true })
keymapset("n", "<C-Right>", ":vertical resize -3<CR>", { noremap = true, silent = true })
keymapset("n", "<S-C-Up>", ":resize +3<CR>", { noremap = true, silent = true })
keymapset("n", "<S-C-Down>", ":resize -3<CR>", { noremap = true, silent = true })
keymapset("n", "<C-h>", "<C-w>h", opts)
keymapset("n", "<C-j>", "<C-w>j", opts)
keymapset("n", "<C-k>", "<C-w>k", opts)
keymapset("n", "<C-l>", "<C-w>l", opts)
keymapset("n", "/", [[/\v]]) -- always use very-magic mode when searching (extended regex)

-- Visual mode
-- https://vim.fandom.com/wiki/Shifting_blocks_visually
keymapset("v", "<leader>y", [[<Esc>'<0v'>g_y]], opts)
keymapset("v", ">", ">gv", opts)
keymapset("v", "<", "<gv", opts)

-- Yanky Plug mappings
keymapset({ "n", "x" }, "y", "<Plug>(YankyYank)")
keymapset({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
keymapset({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
keymapset({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
keymapset({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
keymapset("n", "<c-n>", "<Plug>(YankyCycleForward)")
keymapset("n", "<c-p>", "<Plug>(YankyCycleBackward)")

-- Better help
local autocmd = vim.api.nvim_create_autocmd
local help = vim.api.nvim_create_augroup("HelpOpts", { clear = true })
autocmd("FileType", { pattern = "help", command = "nnoremap <buffer> <CR> <C-]>", group = help })
autocmd("FileType", { pattern = "help", command = "nnoremap <buffer> <BS> <C-T>", group = help })
autocmd("FileType", { pattern = "help", command = [[nnoremap <buffer> o /'\l\{2,\}' <CR>]], group = help })
autocmd("FileType", { pattern = "help", command = [[nnoremap <buffer> O ?'\l\{2,\}' <CR>]], group = help })
autocmd("FileType", { pattern = "help", command = [[nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>]], group = help })
autocmd("FileType", { pattern = "help", command = [[nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>]], group = help })

-- Global
-- My compile and run script
vim.g.asyncrun_open = 6
autocmd("FileType", { pattern = "tex", command = [[let g:asyncrun_open = 0]] })

-- The "jk" at the end is to "jiggle" the cursor so that the statusline reappears
-- after the cmdline output appears
keymapset("", "<leader>r", [[:w! | AsyncRun candrun <c-r>%<CR>jk]], {})
keymapset("", "<leader>m", [[:wa | TermExec cmd="detectmake"<CR>]], {})

keymapset("n", [[<leader>\]], ":NvimTreeToggle<CR>", {})
