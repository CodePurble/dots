vim.api.nvim_set_keymap("", "<F3>", ":Format<CR>", { noremap = true })

-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
            function()
                -- Supports conditional formatting
                if util.get_current_buffer_file_name() == "special.lua" then
                    return nil
                end

                -- Full specification of configurations is down below and in Vim help
                -- files
                return {
                    exe = "stylua",
                    args = {
                        "--stdin-filepath",
                        util.escape_path(util.get_current_buffer_file_path()),
                        "--indent-type Spaces",
                        "--indent-width 4",
                        "--",
                        "-",
                    },
                    stdin = true,
                }
            end,
        },
        c = {
            function()
                return {
                    exe = "astyle",
                    args = { "--options=" .. vim.fn.shellescape(vim.fn.expand("$XDG_CONFIG_HOME/astylerc")) },
                    stdin = true,
                }
            end,
        },
        cpp = {
            function()
                return {
                    exe = "astyle",
                    args = { "--options=" .. vim.fn.shellescape(vim.fn.expand("$XDG_CONFIG_HOME/astylerc")) },
                    stdin = true,
                }
            end,
        },
        python = {
            require("formatter.filetypes.python").black,
        },
        rust = {
            require("formatter.filetypes.rust").rustfmt,
        },
        markdown = {
            require("formatter.filetypes.markdown").prettier,
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})
