local opts = { noremap = true }
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').symbols()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)
-- For Yanky
require("telescope").load_extension("yank_history")
vim.api.nvim_set_keymap("n", "<leader>fy", "<cmd>Telescope yank_history<CR>", opts)
