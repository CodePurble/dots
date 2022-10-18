require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "bibtex",
        "cmake",
        "c",
        "cpp",
        "devicetree",
        "make",
        "python",
        "pioasm",
        "perl",
        "rust",
        "bibtex",
        "verilog",
        "dockerfile",
        "lua",
        "json",
        "toml",
        "yaml",
    },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "gni",
            scope_incremental = "gsi",
            node_decremental = "gnd",
        },
    },
})
