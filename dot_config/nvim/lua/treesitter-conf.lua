require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "cpp",
        "devicetree",
        "python",
        "rust",
        "bibtex",
        "verilog",
        "dockerfile",
        "lua",
        "json",
        "toml"
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
}
