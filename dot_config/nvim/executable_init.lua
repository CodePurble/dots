vim.opt.compatible = false
vim.g.tex_flavor = "latex"

require("plugins")
require("core.general")
require("core.keys")
require("core.templates")
require("configs.neoscroll")
require("configs.lsp")
require("configs.lspconfig")
require("configs.mason")
require("configs.cmp")
require("configs.treesitter")
require("configs.gitsigns")
require("configs.asciidoctor")
require("configs.autoformat")
-- require("configs.peek")
-- require("configs.tablemode")
require("configs.toggleterm")
require("configs.telescope")
require("core.theme")
require("configs.bufferline")
require("configs.statusline")
require("configs.tabout")
require("configs.autopairs")

require("indent_blankline").setup({
    -- char = "|",
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = { "help", "nerdtree", "packer", "dashboard" },
    buftype_exclude = { "terminal" },
})
require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = true,
})
require("colorizer").setup()
require("fidget").setup({
    text = {
        spinner = {
            "∙∙∙",
            "∙∙",
            "∙∙",
            "∙∙",
            "∙∙∙",
        },
    },
})
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua" },
})
require("leap").set_default_keymaps()

-- require("presence"):setup({
--     log_level = "debug"
-- })

-- indent guides
-- let g:indent_blankline_char = "»"

-- selectively use tabs instead of spaces
-- au Filetype make,gitcommit,gitconfig set noexpandtab
-- au Filetype make,gitcommit,gitconfig set listchars=space:·,tab:⭾·

-- vim.g.indent_blankline_char = "|"
-- vim.g.indent_blankline_filetype_exclude = {"help", "nerdtree", "packer", "dashboard"}
-- vim.g.indent_blankline_buftype_exclude = {"terminal"}

-- VimTeX settings
vim.g.vimtex_view_method = "zathura"
vim.g.latex_view_general_viewer = "zathura"
vim.g.vimtex_compiler_progname = "nvr"
-- vim.g.vimtex_view_method = "sioyek"

-- Remove trailing whitespaces on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
-- vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, higroup="Visual"}]]) -- show yanked region with a flash
vim.api.nvim_create_user_command("Reload", "update $MYVIMRC | source $MYVIMRC", { force = true })
vim.api.nvim_create_user_command("Bd", "bp|bd #", {})
