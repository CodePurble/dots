return require("packer").startup({function(use)
    use "wbthomason/packer.nvim"
    -- overall better file "source" management
    use "tjdevries/astronauta.nvim"

    -- LSP/Completion
    use "neovim/nvim-lspconfig"

    use "hrsh7th/nvim-compe"

    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {'nvim-lua/plenary.nvim'}},
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        branch = "0.5-compat",
        run = ":TSUpdate",
    }
    use "kyazdani42/nvim-tree.lua"

    -- Theme/Visual
    use "joshdick/onedark.vim"
    use "folke/lsp-colors.nvim"
    use {
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons",
    }
    -- use "hoob3rt/lualine.nvim"
    use "famiu/feline.nvim"

    use {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end
    }
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
    use "justinmk/vim-sneak"

    use {
        "abecodes/tabout.nvim",
        wants = {'nvim-treesitter'}, -- or require if not used so far
    }

    -- Tim Pope
    use "tpope/vim-surround"
    use "tpope/vim-eunuch"
    use "tpope/vim-fugitive"
    use "tpope/vim-sleuth"

    -- Programming
    use 'Chiel92/vim-autoformat'

    use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
    }
    use "b3nj5m1n/kommentary"


    -- Misc
    use "akinsho/nvim-toggleterm.lua"

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
    -- use "jvirtanen/vim-octave"
    use "editorconfig/editorconfig-vim"
    use "sudar/vim-arduino-syntax"
end,
config = {display = {open_fn = require("packer.util").float}}
})
