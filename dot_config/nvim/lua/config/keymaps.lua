-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true }
local keymapset = vim.keymap.set

keymapset({ "n", "v" }, "<leader>l", "$", opts)
keymapset({ "n", "v" }, "<leader>h", "^", opts)
keymapset("n", "<leader><leader>", "<C-^>", opts)

-- The "jk" at the end is to "jiggle" the cursor so that the statusline reappears
-- after the cmdline output appears
keymapset("", "<leader>r", [[:w! | AsyncRun candrun <c-r>%<CR>jk]], {})
keymapset("", "<leader>m", [[:wa | TermExec cmd="detectmake"<CR>]], {})
