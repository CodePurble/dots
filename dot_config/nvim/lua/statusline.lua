local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")
local utils = require("utils")

local my_colours = {
    greshade1 = "#212121",
    greshade2 = "#424242",
    greshade3 = "#616161",
    greshade4 = "#757575",
    greshade5 = "#9E9E9E",
    greshade6 = "#BDBDBD",
    greshade7 = "#D4D4D4",
    greshade8 = "#EEEEEE",
}

local onedark_colours = {
    black = "#282C34",
    skyblue = "#61AFEF",
    cyan = "#56B6C2",
    green = "#98C379",
    oceanblue = "#3A4f91",
    magenta = "#C678DD",
    orange = "#E08841",
    red = "#E06C75",
    violet = "#9E93E8",
    white = "#ABB2BF",
    yellow = "#E5C07B",
}

local vi_mode_colors = {
    NORMAL = onedark_colours.green,
    OP = onedark_colours.green,
    INSERT = onedark_colours.red,
    VISUAL = onedark_colours.skyblue,
    BLOCK = onedark_colours.skyblue,
    REPLACE = onedark_colours.violet,
    ['V-REPLACE'] = onedark_colours.violet,
    ENTER = onedark_colours.cyan,
    MORE = onedark_colours.cyan,
    SELECT = onedark_colours.orange,
    COMMAND = onedark_colours.green,
    SHELL = onedark_colours.green,
    TERM = onedark_colours.green,
    NONE = onedark_colours.yellow
}

local properties = {
    force_inactive = {
        filetypes = {},
        buftypes = {},
        bufnames = {}
    }
}

local components = {
    left = {
        active = {},
        inactive = {}
    },
    mid = {
        active = {},
        inactive = {}
    },
    right = {
        active = {},
        inactive = {}
    }
}

properties.force_inactive.filetypes = {
    "NvimTree",
    "packer",
    "startify",
    "fugitive",
    "fugitiveblame"
}

properties.force_inactive.buftypes = {
    "terminal"
}

table.insert(components.left.active, {
    provider = "git_branch",
    icon = "  ",
    hl = function()
        local val = {}
        val.fg = "black"
        val.bg = vi_mode_utils.get_mode_color()
        val.style = "bold"
        return val
    end,
    right_sep = {
        {
            str = "right_filled",
            hl = function()
                local val = {}
                val.bg = my_colours.greshade2
                val.fg = vi_mode_utils.get_mode_color()
                val.style = "bold"
                return val
            end,
        }
    },
})

table.insert(components.left.active, {
    provider = "git_diff_added",
    hl = {
        fg = "green",
        bg = my_colours.greshade2
    }
})

table.insert(components.left.active, {
    provider = "git_diff_changed",
    hl = {
        fg = "orange",
        bg = my_colours.greshade2
    }
})

table.insert(components.left.active, {
    provider = "git_diff_removed",
    hl = {
        fg = "red",
        bg = my_colours.greshade2
    },
    right_sep = {str = "right_filled", hl = {fg = my_colours.greshade2}}
})

table.insert(components.mid.active, {
    provider = "",
})

-- table.insert(components.left.active, {
--     provider = "file_info",
--     icon = "",
--     type = "relative",
--     right_sep = {"right", " "}
-- })

table.insert(components.mid.active, {
    provider = "position",
    left_sep = " ",
    right_sep = " ",
})

table.insert(components.right.active, {
    provider = "diagnostic_errors",
    enabled = function() return lsp.diagnostics_exist("Error") end,
    icon = "✖ ",
    hl = { fg = "#FF0000" },
    right_sep = " "
})

table.insert(components.right.active, {
    provider = "diagnostic_warnings",
    enabled = function() return lsp.diagnostics_exist("Warning") end,
    icon = " ",
    hl = { fg = "#F0F722" },
    right_sep = " "
})

table.insert(components.right.active, {
    provider = "diagnostic_info",
    enabled = function() return lsp.diagnostics_exist("Information") end,
    icon = " ",
    hl = { fg = "#1176DB" },
    right_sep = " "
})

table.insert(components.right.active, {
    provider = "diagnostic_hints",
    enabled = function() return lsp.diagnostics_exist("Hint") end,
    icon = "ℍ ",
    hl = { fg = "#C678DD" },
    right_sep = " "
})

table.insert(components.right.active, {
    provider = "file_encoding",
    left_sep = {"left", " "},
    right_sep = " ",
})

table.insert(components.right.active, {
    provider = vim.bo.fileformat:upper(),
    left_sep = {"left", " "},
    right_sep = " ",
})

table.insert(components.right.active, {
    provider = utils.get_buf_indentation_style,
    left_sep = {"left", " "},
    right_sep = " "
})

table.insert(components.right.active, {
    provider = utils.get_asyncrun_running,
    hl = {fg = my_colours.greshade6, bg = my_colours.greshade2, style = "bold"},
    left_sep = {str = "left_filled", hl = {fg = my_colours.greshade2}}
})

table.insert(components.right.active, {
    provider = utils.get_python_venv,
    hl = {
        fg = "white",
        bg = "oceanblue"
    },
    left_sep = {
        {str = "left_filled", hl = {fg = "oceanblue", bg = my_colours.greshade2}},
    },
})

-- table.insert(components.left.active, {
-- components.left.active[5] = {
--     provider = "position",
--     left_sep = " ",
--     right_sep = {
--         " ",
--         {
--             str = "slant_right_2_thin",
--             hl = {
--                 fg = "fg",
--                 bg = "bg"
--             }
--         }
--     }
-- }

require("feline").setup({
    default_bg = "#2D333C",
    default_fg = "#D0D0D0",
    components = components,
    properties = properties,
    colors = onedark_colours,
    vi_mode_colors = vi_mode_colors,
})

