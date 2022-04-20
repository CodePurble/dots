-- Nord
-- vim.cmd([[
-- vim.opt.colorscheme = "nord"
-- highlight Comment cterm=italic gui=italic
-- ]])

-- Onedark
--
-- Joshdick
-- vim.cmd([[
-- let g:onedark_terminal_italics = 1
-- colorscheme onedark
-- ]])
--
-- monsonjeremy
-- require('onedark').setup({
--     commentStyle = "italic",
--     keywordStyle = "italic",
--     functionStyle = "italic"
-- })
-- vim.cmd([[colorscheme onedark]])

-- OneDarkPro.nvim
require('onedarkpro').setup({
    hlgroups = {
        MatchParen = { bg="#2E7D32", fg="#ECEFF4" },
        IndentBlanklineChar = { bg="#323944", fg="#272B30", gui="nocombine" }
    },
    plugins = {
        all = true
    },
    options = {
        bold = true,
        italic = true,
        cursorline = true,
        window_unfocused_color = true
    }
})
require('onedarkpro').load()

-- HACK: Custom highlights don't work if theme is set. Use autocommands till then
-- local hlgrp = vim.api.nvim_create_augroup("HighligtsGroup", { clear = false })
-- vim.api.nvim_create_autocmd("VimEnter", { command = "highlight MatchParen guibg=#2E7D32 guifg=#ECEFF4", group = hlgrp })
-- vim.api.nvim_create_autocmd("VimEnter", { command = "highlight IndentBlanklineChar guibg=#323944 guifg=#272B30 gui=nocombine", group = hlgrp })
