local utils = require("utils")

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "onedark",
        component_separators = { "", "" },
        section_separators = { "", "" },
        disabled_filetypes = {},
    },
    sections = {
        lualine_a = { { "branch", icon = "" } },
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
            "encoding",
            "fileformat",
            "filetype",
            { utils.get_buf_indentation_style },
            { utils.get_asyncrun_running },
        },
        lualine_y = {
            {
                "diagnostics",
                sources = { "nvim_lsp" },
                sections = { "error", "warn", "info", "hint" },
                color_error = "#FF0000",
                color_warn = "#F0F722",
                color_info = "#1176DB",
                color_hint = "#C678DD",
                symbols = { error = "✖ ", warn = " ", info = " ", hint = "ℍ " },
            },
        },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { "quickfix" },
})
