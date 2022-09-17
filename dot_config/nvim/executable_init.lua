vim.opt.compatible = false
vim.g.tex_flavor = "latex"

require("plugins")

-- My COC EXTENSIONS (not used anymore, here just for reference)
-- Show with    :CocList extensions
-- Install with :CocInstall <extension>
-- ------------------
--  coc-pyright
--  coc-json
--  coc-clangd
--  coc-rust-analyzer

require("general")
require("configs.keys")
require("templates")
require("configs.lsp")
require("configs.cmp")
require("configs.treesitter")
require("configs.gitsigns")
require("configs.asciidoctor")
require("configs.autoformat")
-- require("configs.tablemode")
require("configs.toggleterm")
require("configs.telescope")
require("theme")
require("configs.bufferline")
require("configs.statusline")
require("configs.tabout")
require("configs.autopairs")

-- Source init.vim whenever it is written to
-- au! BufWritePost $MYVIMRC source $MYVIMRC
-- au! BufWritePost configs.lua source $MYVIMRC

-- indent guides
-- let g:indent_blankline_char = "»"

require("indent_blankline").setup{
    -- char = "|",
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = {"help", "nerdtree", "packer", "dashboard"},
    buftype_exclude = {"terminal"}
}

-- vim.g.indent_blankline_char = "|"
-- vim.g.indent_blankline_filetype_exclude = {"help", "nerdtree", "packer", "dashboard"}
-- vim.g.indent_blankline_buftype_exclude = {"terminal"}

-- VimTeX settings
vim.g.vimtex_view_method = "zathura"
vim.g.latex_view_general_viewer = "zathura"
vim.g.vimtex_compiler_progname = "nvr"
-- vim.g.vimtex_view_method = "sioyek"


require('nvim-tree').setup{
    disable_netrw = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = true
}

-- vim.g.nvim_tree_auto_open = 1

-- Do not source the default filetype.vim
-- Required for filetype.nvim
vim.g.did_load_filetypes = 1

require("colorizer").setup()
require("fidget").setup{
    text = {
        spinner = {
            "∙∙∙",
            "∙∙",
            "∙∙",
            "∙∙",
            "∙∙∙",
        },
    }
}
-- require("presence"):setup({
--     log_level = "debug"
-- })

-- selectively use tabs instead of spaces
-- au Filetype make,gitcommit,gitconfig set noexpandtab
-- au Filetype make,gitcommit,gitconfig set listchars=space:·,tab:⭾·

-- Remove trailing whitespaces on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, higroup="Visual"}]]) -- show yanked region with a flash
-- vim.cmd([[autocmd ColorScheme * lua require'lightspeed'.init_highlight(true)]]) -- enforce default highlighting for lightspeed
vim.api.nvim_create_user_command('ReloadConfig', "lua require('plenary.reload').reload_module('conf')", { force = true })
vim.api.nvim_create_user_command('Bd', "bp|bd #", {})
