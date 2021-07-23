-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect,noinsert" -- for nvim-compe
-- vim.g.completion_chain_complete_list = {
--     default = {
--     }
-- }

-- Use <Tab> and <S-Tab> to navigate through popup menu
local opts = {noremap = true, expr = true}
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', opts)
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', opts)

