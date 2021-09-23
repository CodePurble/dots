local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")
local utils = require("utils")
local onedark_colours = utils.all_colours.onedark_colours
local nord_colours = utils.all_colours.nord_colours

-- Used only for setting the global colours
local colours = onedark_colours
colours.bg = nord_colours.nord1
colours.fg = "#D0D0D0"

--
-- COLOURS
--
local vi_mode_colors = {
    ['NORMAL'] = onedark_colours.green,
    ['OP'] = onedark_colours.green,
    ['INSERT'] = onedark_colours.red,
    ['VISUAL'] = onedark_colours.skyblue,
    ['LINES'] = onedark_colours.skyblue,
    ['BLOCK'] = onedark_colours.skyblue,
    ['REPLACE'] = onedark_colours.violet,
    ['V-REPLACE'] = onedark_colours.violet,
    ['ENTER'] = onedark_colours.cyan,
    ['MORE'] = onedark_colours.cyan,
    ['SELECT'] = onedark_colours.orange,
    ['COMMAND'] = onedark_colours.green,
    ['SHELL'] = onedark_colours.green,
    ['TERM'] = onedark_colours.green,
    ['NONE'] = onedark_colours.yellow
}

local components = {
    active = {},
    inactive = {}
}

-- left -> active[1]
-- mid -> active[2]
-- right -> active[3]
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

-- left -> active[1]
-- mid -> active[2]
-- right -> active[3]
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
                style = "bold"
            }
        end,
        right_sep = {
            {
                str = " ",
                hl = function()
                    return {
                        bg = vi_mode_utils.get_mode_color(),
                        -- bg = colours.bg,
                        -- bg = nord_colours.nord3,
                        style = "bold"
                    }
                end
            },
            {
                str = "right_filled",
                hl = function()
                    return {
                        fg = vi_mode_utils.get_mode_color(),
                        -- bg = colours.bg,
                        -- bg = nord_colours.nord3,
                        style = "bold"
                    }
                end
            }
        }
    },
    {
        provider = "git_diff_added",
        hl = {
            fg = "green",
        },
    },
    {
        provider = "git_diff_changed",
        hl = {
            fg = "orange",
        },
    },
    {
        provider = "git_diff_removed",
        hl = {
            fg = "red",
        },
    }
}
components.inactive[1] = {
    {
        provider = " ",
        icon = "",
    }
}

--
-- MIDDLE COMPONENTS
--
components.active[2] = {
    {
        provider = "file_info",
        icon = "",
        type = "relative",
        left_sep = {
            str = "right",
            hl = {
                fg = colours.fg
            }
        }
    },
    {
        provider = "@"
    },
    {
        provider = "position",
        left_sep = " ",
        right_sep = {
            {
                str = " ",
                hl = {
                    bg = colours.bg
                }
            },
            {
                str = "left",
                hl = {
                    fg = colours.fg
                }
            },
        }
    },
}
components.inactive[2] = {
    {
        provider = "file_info",
        icon = "",
        type = "relative",
        left_sep = {
            str = "left",
            hl = {
                fg = colours.fg
            }
        },
        right_sep = {
            str = "right",
            hl = {
                fg = colours.fg
            }
        }
    }
}

--
-- RIGHT COMPONENTS
--
components.active[3] = {
    {
        provider = "diagnostic_errors",
        enabled = function() return lsp.diagnostics_exist("Error") end,
        icon = "✖ ",
        hl = {
            fg = "#FF0000"
        },
    },
    {
        provider = "diagnostic_warnings",
        enabled = function() return lsp.diagnostics_exist("Warning") end,
        icon = " ",
        hl = {
            fg = "#F0F722"
        },
        right_sep = " "
    },
    {
        provider = "diagnostic_info",
        enabled = function() return lsp.diagnostics_exist("Information") end,
        icon = " ",
        hl = {
            fg = "#1176DB"
        },
        right_sep = " "
    },
    {
        provider = "diagnostic_hints",
        enabled = function() return lsp.diagnostics_exist("Hint") end,
        icon = "ℍ ",
        hl = {
            fg = "#C678DD"
        },
        right_sep = " "
    },
    {
        provider = "file_encoding",
        left_sep = {
            {
                str = "left",
                hl = {
                    fg = colours.fg,
                    bg = colours.bg
                }
            },
            " "
        },
        right_sep = " ",
    },
    {
        provider = vim.bo.fileformat:upper(),
        left_sep = {
            {
                str = "left",
                hl = {
                    fg = colours.fg,
                    bg = colours.bg
                }
            },
            " "
        },
        right_sep = " ",
    },
    {
        provider = utils.get_buf_indentation_style,
        left_sep = {
            {
                str = "left",
                hl = {
                    fg = colours.fg,
                    bg = colours.bg
                }
            },
            " "
        },
        right_sep = " "
    },
    {
        provider = utils.get_asyncrun_running,
        hl = {
            fg = nord_colours.nord5,
            bg = nord_colours.nord10,
            style = "bold"
        },
        left_sep = {
            {
                str = "left_filled",
                hl = {
                    fg = nord_colours.nord10
                }
            },
        },
        -- right_sep = {
        --     str = " ",
        --     hl = {
        --         bg = nord_colours.nord3
        --     }
        -- }
    },
    {
        provider = utils.get_python_venv,
        hl = {
            fg = nord_colours.nord3,
            bg = nord_colours.nord9,
            style = "bold"
        },
        left_sep = {
            {
                str = "vertical_bar",
                hl = {
                    fg = nord_colours.nord1,
                    bg = nord_colours.nord9,
                }
            },
        },
    },
}

require("feline").setup({
    components = components,
    colors = colours,
    force_inactive = {
        filetypes = {
            "NvimTree",
            "packer",
            "startify",
            "fugitive",
            "fugitiveblame",
            "dashboard"
        },
        buftypes = {
            "terminal"
        },
        bufnames = {}
    },
    vi_mode_colors = vi_mode_colors
})

