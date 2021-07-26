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

-- vimscript config files
require("general-conf")
require("keys-conf")
require("lsp-conf")
require("compe-conf")
require("treesitter-conf")
-- require("lualine-conf")
require("bufferline-conf")
require("gitsigns-conf")
require("templates-conf")
require("asciidoctor-conf")
require("autoformat-conf")
-- require("tablemode-conf")
require("sneak-conf")
require("toggleterm-conf")
require("kommentary-conf")
require("todo-comments").setup()
require("colorizer").setup()
require("pears").setup()
require("theme")
require("statusline")

-- Source init.vim whenever it is written to
-- au! BufWritePost $MYVIMRC source $MYVIMRC
-- au! BufWritePost plugins.lua source $MYVIMRC

-- indent guides
-- let g:indent_blankline_char = "»"

vim.g.indent_blankline_char = "|"
vim.g.indent_blankline_filetype_exclude = {"help", "nerdtree", "packer"}
vim.g.indent_blankline_buftype_exclude = {"terminal"}

-- selectively use tabs instead of spaces
-- au Filetype make,gitcommit,gitconfig set noexpandtab
-- au Filetype make,gitcommit,gitconfig set listchars=space:·,tab:⭾·

-- Remove trailing whitespaces on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
