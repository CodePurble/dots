return require("packer").startup({function(use)
    use "wbthomason/packer.nvim"

    -- fast filetype detection
    use "nathom/filetype.nvim"

    -- LSP/Completion
    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-emoji"
    use "onsails/lspkind-nvim"
    use "p00f/clangd_extensions.nvim"
    use "j-hui/fidget.nvim"
    -- use "ray-x/cmp-treesitter"

    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {'nvim-lua/plenary.nvim'}},
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "kyazdani42/nvim-tree.lua"

    -- Theme/Visual
    use 'olimorris/onedarkpro.nvim'
    -- use "monsonjeremy/onedark.nvim"
    -- use "joshdick/onedark.vim"
    use "folke/lsp-colors.nvim"
    use {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    -- use "hoob3rt/lualine.nvim"
    -- use { "famiu/feline.nvim", tag = 'v0.3.3' }
    use "feline-nvim/feline.nvim"

    use "norcalli/nvim-colorizer.lua"
    use "psliwka/vim-smoothie"
    use "andweeb/presence.nvim"
    use "folke/zen-mode.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("todo-comments").setup() end
    }

    -- Navigation
    use 'ggandor/lightspeed.nvim'
    -- use "justinmk/vim-sneak"

    use {
        "abecodes/tabout.nvim",
        wants = {'nvim-treesitter'}, -- or require if not used so far
    }

    -- Tim Pope
    use "tpope/vim-surround"
    use "tpope/vim-eunuch"
    use "tpope/vim-fugitive"
    use "tpope/vim-sleuth"
    use "tpope/vim-repeat"

    -- Programming
    use 'Chiel92/vim-autoformat'

    use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Misc
    use "akinsho/toggleterm.nvim"

    -- Ahh the bliss of being in Vim
    use "majutsushi/tagbar"
    use "windwp/nvim-autopairs"
    use "conradirwin/vim-bracketed-paste"
    use "skywind3000/asyncrun.vim"

    -- FileType specific
    use "lervag/vimtex"
    use {
        "dhruvasagar/vim-table-mode",
        ft = "markdown",
    }
    use {
        "habamax/vim-asciidoctor",
        ft = "asciidoctor",
    }
    use {"arm9/arm-syntax-vim", ft = "arm"}
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", ft = "markdown"}
    use "jvirtanen/vim-octave"
    use "editorconfig/editorconfig-vim"
    use "sudar/vim-arduino-syntax"
    use 'mboughaba/i3config.vim'
end,
config = {display = {open_fn = require("packer.util").float}}
})
