-- Below not required when using LazyVim
local rp_utils = require("rp_utils")

-- local onedark_colours = rp_utils.all_colours.onedark_colours
-- local nord_colours = rp_utils.all_colours.nord_colours
local nerdfont_symbols = rp_utils.nerdfont_symbols

-- Used only for setting the global colours
-- local line_fg_bg = {
--   fg = "#D0D0D0",
--   bg = nord_colours.nord1,
-- }

local active_sections = {
  lualine_a = {
    {
      "branch",
      icon = "",
      separator = {
        left = "",
        right = nerdfont_symbols.right_filled,
      },
      draw_empty = true,
    },
    {
      "diff",
      colored = false,
      source = rp_utils.gitdiff_source,
      separator = {
        left = "",
        right = nerdfont_symbols.right_filled,
      },
    },
  },
  lualine_b = {
    {
      rp_utils.get_active_lsp_clients,
      separator = {
        left = "",
        right = nerdfont_symbols.right_filled,
      },
      draw_empty = true,
    },
  },
  lualine_c = {
    {
      "filetype",
      icon_only = true,
      separator = {
        left = "",
        right = "",
      },
    },
    {
      "filename",
      file_status = true,
      newfile_status = true,
      path = 1,
      symbols = {
        modified = nerdfont_symbols.circle,
        readonly = nerdfont_symbols.lock,
        unnamed = "[No Name]",
        newfile = "[New]",
      },
      separator = {
        left = "",
        right = "",
      },
    },
    {
      "location",
    },
  },
  lualine_x = {
    {
      rp_utils.get_python_venv,
      icon = nerdfont_symbols.python,
      separator = {
        left = nerdfont_symbols.left,
        right = "",
      },
    },
    {
      rp_utils.get_asyncrun_running,
      icon = nerdfont_symbols.code_file,
      separator = {
        left = nerdfont_symbols.left,
        right = "",
      },
    },
  },
  lualine_y = {
    {
      "diagnostics",
      symbols = {
        error = nerdfont_symbols.cross,
        warn = nerdfont_symbols.excl,
        info = nerdfont_symbols.info,
        hint = nerdfont_symbols.square,
      },
      separator = {
        left = nerdfont_symbols.left_filled,
        right = "",
      },
      draw_empty = true,
    },
  },
  lualine_z = {
    {
      "fileformat",
      icons_enabled = true,
      symbols = {
        unix = "LF",
        dos = "CRLF",
        mac = "CR",
      },
      separator = {
        left = nerdfont_symbols.left_filled,
        right = "",
      },
    },
    {
      "encoding",
    },
    {
      rp_utils.get_buf_indentation_style,
    },
  },
}

local inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "onedark",
      disabled_filetypes = {},
    },
    sections = active_sections,
    inactive_sections = inactive_sections,
    tabline = {},
    extensions = { "quickfix", "toggleterm" },
  },
}
