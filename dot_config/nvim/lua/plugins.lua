return require("packer").startup({
    function(use)
        use("wbthomason/packer.nvim")

        -- LSP/Completion
        use("williamboman/mason.nvim")
        use("williamboman/mason-lspconfig.nvim")
        use("neovim/nvim-lspconfig")
        use("hrsh7th/nvim-cmp")
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-nvim-lua")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")
        use("hrsh7th/cmp-emoji")
        use("hrsh7th/cmp-nvim-lsp-signature-help")
        use("onsails/lspkind-nvim")
        use("p00f/clangd_extensions.nvim")
        use("j-hui/fidget.nvim")

        -- Telescope and friends
        use({
            "nvim-telescope/telescope.nvim",
            requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
        })
        use({
            "nvim-telescope/telescope-symbols.nvim",
            requires = {
                { "nvim-telescope/telescope.nvim" },
            },
        })
        use({
            "nvim-telescope/telescope-bibtex.nvim",
            requires = {
                { "nvim-telescope/telescope.nvim" },
            },
            config = function()
                require("telescope").load_extension("bibtex")
            end,
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
        })

        use("nvim-tree/nvim-tree.lua")
        use("nvim-tree/nvim-web-devicons")

        -- Theme/Visual
        use("olimorris/onedarkpro.nvim")
        use("folke/lsp-colors.nvim")
        use({
            "akinsho/bufferline.nvim",
            requires = "nvim-tree/nvim-web-devicons",
        })
        use("feline-nvim/feline.nvim")
        use("gbprod/yanky.nvim")
        use("norcalli/nvim-colorizer.lua")
        use("karb94/neoscroll.nvim")
        use("andweeb/presence.nvim")
        use("folke/zen-mode.nvim")
        use("lukas-reineke/indent-blankline.nvim")
        use({
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup()
            end,
        })

        -- Navigation
        use("ggandor/leap.nvim")

        -- Tim Pope
        use("tpope/vim-surround")
        use("tpope/vim-eunuch")
        use("tpope/vim-fugitive")
        use("tpope/vim-sleuth")
        use("tpope/vim-repeat")

        -- Programming
        use("mhartington/formatter.nvim")
        use({
            "lewis6991/gitsigns.nvim",
            requires = { "nvim-lua/plenary.nvim" },
        })
        use("numToStr/Comment.nvim")

        -- Misc
        use("akinsho/toggleterm.nvim")

        -- Ahh the bliss of being in Vim
        use("majutsushi/tagbar")
        use("windwp/nvim-autopairs")
        use("conradirwin/vim-bracketed-paste")
        use("skywind3000/asyncrun.vim")

        -- FileType specific
        use("lervag/vimtex")
        use({
            "dhruvasagar/vim-table-mode",
            ft = "markdown",
        })
        use({
            "habamax/vim-asciidoctor",
            ft = "asciidoctor",
        })
        use({ "arm9/arm-syntax-vim", ft = "arm" })
        use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }) --, ft = "markdown"}
        -- use({ "toppair/peek.nvim", run = "deno task --quiet build:fast", branch = "separate-process" }) --, ft = "markdown"}
        use("jvirtanen/vim-octave")
        use("editorconfig/editorconfig-vim")
        use("sudar/vim-arduino-syntax")
        use("mboughaba/i3config.vim")
        use({
            "abecodes/tabout.nvim",
            wants = { "nvim-treesitter" }, -- or require if not used so far
        })
    end,
    config = { display = { open_fn = require("packer.util").float } },
})
