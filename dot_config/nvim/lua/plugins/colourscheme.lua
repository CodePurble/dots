return {
  -- ----------------------------------------------------------------------
  -- olimorris/onedarkpro.nvim
  -- ----------------------------------------------------------------------
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   opts = {
  --     theme = "onedark",
  --     highlights = {
  --       MatchParen = { bg = "#2E7D32", fg = "#ECEFF4" },
  --       IndentBlanklineContextChar = { fg = "#818387" },
  --       IndentBlanklineContextSpaceChar = { fg = "#373a43" },
  --       IndentBlanklineContextStart = { bg = "#43474e" },
  --       -- use a darker bg for non-current/active buffers
  --       NormalNC = { bg = "#22252c" },
  --       Whitespace = { fg = "#373a43" }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
  --       Conceal = { fg = "#535965" }, -- placeholder characters substituted for concealed text (see 'conceallevel')
  --     },
  --     plugins = {
  --       all = true,
  --     },
  --     options = {
  --       bold = true,
  --       italic = true,
  --       cursorline = true,
  --       window_unfocused_color = true,
  --     },
  --   },
  -- },
  -- ----------------------------------------------------------------------
  -- ----------------------------------------------------------------------
  -- navarasu/onedark.nvim
  -- --------------------------------------------------------------------
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "dark",
      code_style = {
        comments = "italic",
        keywords = "bold",
        functions = "none",
        strings = "none",
        variables = "none",
      },
    },
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     style = "storm",
  --     styles = {
  --       keywords = { bold = true },
  --     },
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
