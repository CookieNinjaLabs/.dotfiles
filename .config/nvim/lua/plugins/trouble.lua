return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  -- TODO: Das ist ein Test TODO
  keys = {
    {
      "<leader>yy",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble) for the whole workspace",
    },
    {
      "<leader>yY",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>yl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Open (Trouble) location list",
    },
    {
      "<leader>yt",
      "<cmd>Trouble todo toggle<cr>",
      desc = "Open (Trouble) TODOs",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>yL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    -- WARN: Test Warning
    {
      "<leader>yQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
