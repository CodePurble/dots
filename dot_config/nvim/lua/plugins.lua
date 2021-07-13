local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'

    -- nvim goodness
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- Theme/Visual
    use 'joshdick/onedark.vim'
    use 'hoob3rt/lualine.nvim'
    use {'rrethy/vim-hexokinase', run = 'make hexokinase'}
    use {'junegunn/goyo.vim', ft = {'markdown', 'latex', 'asciidoctor'}}
    use 'nathanaelkane/vim-indent-guides'
    use 'psliwka/vim-smoothie'
    use 'andweeb/presence.nvim'
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

    -- Tim Pope
    use 'tpope/vim-surround'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-fugitive'

    -- Ahh the bliss of being in Vim
    use {'majutsushi/tagbar', cmd = 'TagbarToggle'}
    use 'cohama/lexima.vim'
    use 'justinmk/vim-sneak'
    use 'chiel92/vim-autoformat'
    use 'preservim/nerdcommenter'
    use 'conradirwin/vim-bracketed-paste'
    use {'skywind3000/asyncrun.vim', cmd = 'AsyncRun'}
    use 'ervandew/supertab'
    use 'akinsho/nvim-toggleterm.lua'

    -- FileType dependant
    -- use 'jackguo380/vim-lsp-cxx-highlight'
    -- use 'bfrg/vim-cpp-modern'
    use {'lervag/vimtex', ft = {'latex', 'tex'}}
    use {'dhruvasagar/vim-table-mode', ft = 'markdown'}
    use {'habamax/vim-asciidoctor', ft = 'asciidoctor'}
    use {'arm9/arm-syntax-vim', ft = 'arm'}
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', ft = 'markdown'}
    use 'jvirtanen/vim-octave'
    use 'editorconfig/editorconfig-vim'
    use 'sudar/vim-arduino-syntax'
end,
config = {display = {open_fn = require('packer.util').float}}
}
)
