return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "astyle" },
      cpp = { "astyle" },
      python = { "black" },
      rust = { "rustfmt" },
      markdown = { "prettier" },
    },
    formatters = {
      astyle = {
        args = { "--options=/home/ramprakash/.config/astylerc" },
      },
    },
  },
  keys = {
    {
      "<F3>",
      function()
        require("conform").format()
      end,
      desc = "Run formatter on current buffer",
    },
  },
}
