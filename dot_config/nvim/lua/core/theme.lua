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
require("onedarkpro").setup({
    theme = "onedark",
    highlights = {
        MatchParen = { bg = "#2E7D32", fg = "#ECEFF4" },
        IndentBlanklineContextChar = { fg = "#818387" },
        IndentBlanklineContextSpaceChar = { fg = "#373a43" },
        IndentBlanklineContextStart = { bg = "#43474e" },
        -- use a darker bg for non-current/active buffers
        NormalNC = { bg = "#22252c" },
        Whitespace = { fg = "#373a43" }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        Conceal = { fg = "#535965" }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    },
    plugins = {
        all = true,
    },
    options = {
        bold = true,
        italic = true,
        cursorline = true,
        window_unfocused_color = true,
    },
})
require("onedarkpro").load()

-- vim.api.nvim_set_hl(0, "ActiveWindow", { ctermbg = string.format() })
-- vim.opt.winhighlight = "Normal:ActiveWindow,NormalNC:InactiveWindow"
--
-- vim.cmd[[
-- hi ActiveWindow guibg=#282c34
-- hi InactiveWindow guibg=#22252c
-- set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
-- ]]

-- HACK: Custom highlights don't work if theme is set. Use autocommands till then
-- local hlgrp = vim.api.nvim_create_augroup("HighligtsGroup", { clear = false })
-- vim.api.nvim_create_autocmd("VimEnter", { command = "highlight MatchParen guibg=#2E7D32 guifg=#ECEFF4", group = hlgrp })
-- vim.api.nvim_create_autocmd("VimEnter", { command = "highlight IndentBlanklineChar guibg=#323944 guifg=#272B30 gui=nocombine", group = hlgrp })
