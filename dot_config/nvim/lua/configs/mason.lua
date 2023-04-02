require("mason").setup({
    ui = {
        icons = {
            -- The list icon to use for installed packages.
            package_installed = "",
            -- The list icon to use for packages that are pending installation.
            package_pending = "",
            -- The list icon to use for packages that are not installed.
            package_uninstalled = "",
        },
        keymaps = {
            -- Keymap to expand a package in the UI
            toggle_package_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "X",
        },
    },

    -- Controls to which degree logs are written to the log file. It's useful
    -- to set this to vim.log.levels.DEBUG when debugging issues with package
    -- installations.
    log_level = vim.log.levels.INFO,
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",
        "lua-language-server",
        "pyright",
        "texlab",
        "marksman",
    },
    automatic_installation = false,
})

