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
require('onedark').setup({
    commentStyle = "italic",
    keywordStyle = "italic",
    functionStyle = "italic"
})
vim.cmd([[colorscheme onedark]])

-- kanagawa.nvim
-- vim.cmd("colorscheme kanagawa")

-- HACK: Custom highlights don't work if theme is set. Use autocommands till then
-- vim.highlight.create('MatchParen', {guibg="#2E7D32", guifg="#ECEFF4"}, false)
-- vim.highlight.create('IndentBlanklineChar', {guibg="#323944", guifg="#272B30", gui="nocombine"}, false)
vim.cmd([[
au VimEnter * highlight MatchParen guibg=#2E7D32 guifg=#ECEFF4
au VimEnter * highlight IndentBlanklineChar guibg=#323944 guifg=#272B30 gui=nocombine
]])
