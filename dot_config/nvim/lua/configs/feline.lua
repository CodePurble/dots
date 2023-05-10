local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local utils = require("utils")
local onedark_colours = utils.all_colours.onedark_colours
local nord_colours = utils.all_colours.nord_colours

-- Used only for setting the global colours
local line_fg_bg = {
    fg = "#D0D0D0",
    bg = nord_colours.nord1,
}

--
-- COLOURS
--
local vi_mode_colors = {
    ["NORMAL"] = onedark_colours.green,
    ["OP"] = onedark_colours.green,
    ["INSERT"] = onedark_colours.red,
    ["VISUAL"] = onedark_colours.skyblue,
    ["LINES"] = onedark_colours.skyblue,
    ["BLOCK"] = onedark_colours.skyblue,
    ["REPLACE"] = onedark_colours.violet,
    ["V-REPLACE"] = onedark_colours.violet,
    ["ENTER"] = onedark_colours.cyan,
    ["MORE"] = onedark_colours.cyan,
    ["SELECT"] = onedark_colours.orange,
    ["COMMAND"] = onedark_colours.green,
    ["SHELL"] = onedark_colours.green,
    ["TERM"] = onedark_colours.green,
    ["NONE"] = onedark_colours.yellow,
}

local components = {
    active = {},
    inactive = {},
}

-- left -> active[1]
-- mid -> active[2]
-- right -> active[3]
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

-- left -> inactive[1]
-- mid -> inactive[2]
-- right -> inactive[3]
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

--
-- LEFT COMPONENTS
--
components.active[1] = {
    {
        provider = "git_branch",
        icon = "  ",
        hl = function()
            return {
                fg = "black",
                bg = vi_mode_utils.get_mode_color(),
                style = "bold",
            }
        end,
        right_sep = {
            {
                str = " ",
                hl = function()
                    return {
                        bg = vi_mode_utils.get_mode_color(),
                        style = "bold",
                    }
                end,
            },
            {
                str = "right_filled",
                hl = function()
                    return {
                        fg = vi_mode_utils.get_mode_color(),
                        bg = line_fg_bg.bg,
                        style = "bold",
                    }
                end,
            },
        },
    },
    {
        provider = "git_diff_added",
        hl = {
            fg = onedark_colours.green,
            bg = line_fg_bg.bg,
            style = "bold",
        },
    },
    {
        provider = "git_diff_changed",
        hl = {
            fg = onedark_colours.orange,
            bg = line_fg_bg.bg,
            style = "bold",
        },
    },
    {
        provider = "git_diff_removed",
        hl = {
            fg = onedark_colours.red,
            bg = line_fg_bg.bg,
            style = "bold",
        },
    },
    {
        provider = "",
        hl = {
            fg = line_fg_bg.bg,
            bg = onedark_colours.grey,
        },
    },
    {
        provider = "lsp_client_names",
        hl = {
            fg = line_fg_bg.fg,
            bg = onedark_colours.grey,
            style = "bold",
        },
        left_sep = {
            {
                str = " ",
                hl = {
                    bg = onedark_colours.grey,
                },
            },
        },
        right_sep = {
            {
                str = " ",
                hl = {
                    bg = onedark_colours.grey,
                },
            },
        },
    },
    {
        provider = "",
        hl = {
            fg = onedark_colours.grey,
            bg = line_fg_bg.bg,
        },
    },
}
components.inactive[1] = {
    {
        hl = {
            fg = line_fg_bg.fg,
            bg = line_fg_bg.bg,
        },
    },
}

--
-- MIDDLE COMPONENTS
--
components.active[2] = {
    {
        provider = "file_info",
        hl = {
            fg = line_fg_bg.fg,
            bg = onedark_colours.oceanblue,
            style = "bold",
        },
        icon = "",
        file_readonly_icon = "",
        type = "relative",
        left_sep = {
            {
                str = "left_filled",
                hl = {
                    fg = onedark_colours.oceanblue,
                    bg = line_fg_bg.bg,
                },
            },
            {
                str = " ",
                hl = {
                    bg = onedark_colours.oceanblue,
                },
            },
        },
        right_sep = {
            str = " ",
            hl = {
                fg = line_fg_bg.fg,
                bg = onedark_colours.oceanblue,
            },
        },
    },
    {
        provider = "@",
        hl = {
            fg = line_fg_bg.fg,
            bg = onedark_colours.oceanblue,
            style = "bold",
        },
    },
    {
        provider = "position",
        hl = {
            fg = line_fg_bg.fg,
            bg = onedark_colours.oceanblue,
            style = "bold",
        },
        left_sep = {
            str = " ",
            hl = {
                bg = onedark_colours.oceanblue,
            },
        },
        right_sep = {
            {
                str = " ",
                hl = {
                    bg = onedark_colours.oceanblue,
                },
            },
            {
                str = "right_filled",
                hl = {
                    fg = onedark_colours.oceanblue,
                    bg = line_fg_bg.bg,
                },
            },
            {
                str = " ",
                hl = {
                    bg = line_fg_bg.bg,
                },
            },
        },
    },
}
components.inactive[2] = {
    {
        provider = "file_info",
        hl = {
            fg = line_fg_bg.fg,
            bg = onedark_colours.oceanblue,
            style = "bold",
        },
        icon = "",
        file_readonly_icon = "",
        type = "relative",
        left_sep = {
            {
                str = "left_filled",
                hl = {
                    fg = onedark_colours.oceanblue,
                    bg = line_fg_bg.bg,
                },
            },
            {
                str = " ",
                hl = {
                    fg = line_fg_bg.fg,
                    bg = onedark_colours.oceanblue,
                },
            },
        },
        right_sep = {
            {
                str = " ",
                hl = {
                    fg = line_fg_bg.fg,
                    bg = onedark_colours.oceanblue,
                },
            },
            {
                str = "right_filled",
                hl = {
                    fg = onedark_colours.oceanblue,
                    bg = line_fg_bg.bg,
                },
            },
        },
    },
    {
        provider = " ",
        hl = {
            fg = line_fg_bg.fg,
            bg = line_fg_bg.bg,
        },
    },
}

--
-- RIGHT COMPONENTS
--
components.active[3] = {
    {
        provider = "",
        hl = {
            fg = onedark_colours.grey,
            bg = line_fg_bg.bg,
        },
    },
    {
        provider = "diagnostic_errors",
        enabled = function()
            return lsp.diagnostics_exist("Error")
        end,
        icon = "✖ ",
        hl = {
            fg = onedark_colours.red,
            bg = onedark_colours.grey,
            style = "bold",
        },
        right_sep = {
            str = " ",
            hl = {
                fg = line_fg_bg.fg,
                bg = onedark_colours.grey,
            },
        },
    },
    {
        provider = "diagnostic_warnings",
        enabled = function()
            return lsp.diagnostics_exist("Warn")
        end,
        icon = " ",
        hl = {
            fg = onedark_colours.yellow,
            bg = onedark_colours.grey,
            style = "bold",
        },
        right_sep = {
            str = " ",
            hl = {
                fg = line_fg_bg.fg,
                bg = onedark_colours.grey,
            },
        },
    },
    {
        provider = "diagnostic_info",
        enabled = function()
            return lsp.diagnostics_exist("Info")
        end,
        icon = " ",
        hl = {
            fg = onedark_colours.oceanblue,
            bg = onedark_colours.grey,
            style = "bold",
        },
        right_sep = {
            str = " ",
            hl = {
                fg = line_fg_bg.fg,
                bg = onedark_colours.grey,
            },
        },
    },
    {
        provider = "diagnostic_hints",
        enabled = function()
            return lsp.diagnostics_exist("Hint")
        end,
        icon = "ℍ ",
        hl = {
            fg = onedark_colours.magenta,
            bg = onedark_colours.grey,
            style = "bold",
        },
        right_sep = {
            str = " ",
            hl = {
                fg = line_fg_bg.fg,
                bg = onedark_colours.grey,
            },
        },
    },
    -- {
    --     provider = " ",
    --     hl = {
    --         bg = onedark_colours.grey
    --     }
    -- },
    {
        provider = "file_encoding",
        hl = {
            fg = onedark_colours.black,
            bg = onedark_colours.cyan,
            style = "bold",
        },
        left_sep = {
            {
                str = "left_filled",
                hl = {
                    fg = onedark_colours.cyan,
                    bg = onedark_colours.grey,
                },
            },
            {
                str = " ",
                hl = {
                    bg = onedark_colours.cyan,
                },
            },
        },
        right_sep = {
            str = " ",
            hl = {
                bg = onedark_colours.cyan,
            },
        },
    },
    {
        provider = vim.bo.fileformat:upper(),
        hl = {
            fg = onedark_colours.black,
            bg = onedark_colours.yellow,
            style = "bold",
        },
        left_sep = {
            {
                str = "left_filled",
                hl = {
                    fg = onedark_colours.yellow,
                    bg = onedark_colours.cyan,
                },
            },
            {
                str = " ",
                hl = {
                    bg = onedark_colours.yellow,
                },
            },
        },
        right_sep = {
            str = " ",
            hl = {
                bg = onedark_colours.yellow,
            },
        },
    },
    {
        provider = utils.get_buf_indentation_style,
        hl = {
            fg = onedark_colours.black,
            bg = onedark_colours.orange,
            style = "bold",
        },
        left_sep = {
            {
                str = "left_filled",
                hl = {
                    fg = onedark_colours.orange,
                    bg = onedark_colours.yellow,
                },
            },
            {
                str = " ",
                hl = {
                    bg = onedark_colours.orange,
                },
            },
        },
        right_sep = {
            str = " ",
            hl = {
                bg = onedark_colours.orange,
            },
        },
    },
    {
        provider = utils.get_python_venv,
        hl = {
            fg = onedark_colours.black,
            bg = nord_colours.nord9,
            style = "bold",
        },
        left_sep = {
            {
                str = "vertical_bar",
                hl = {
                    fg = nord_colours.nord1,
                    bg = nord_colours.nord9,
                },
            },
        },
    },
    {
        provider = utils.get_asyncrun_running,
        hl = {
            fg = onedark_colours.black,
            bg = onedark_colours.skyblue,
            style = "bold",
        },
        left_sep = {
            {
                str = "vertical_bar",
                hl = {
                    fg = onedark_colours.black,
                    bg = onedark_colours.skyblue,
                },
            },
        },
        -- right_sep = {
        --     str = " ",
        --     hl = {
        --         bg = nord_colours.nord3
        --     }
        -- }
    },
}

require("feline").setup({
    components = components,
    theme = line_fg_bg,
    -- force_inactive = {
    --     filetypes = {
    --         "NvimTree",
    --         "packer",
    --         "startify",
    --         "fugitive",
    --         "fugitiveblame",
    --         "dashboard"
    --     },
    --     buftypes = {
    --         "terminal"
    --     },
    --     bufnames = {}
    -- },
    vi_mode_colors = vi_mode_colors,
})

