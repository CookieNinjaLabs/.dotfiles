return {
  -- mit <leader>ft kann man die Namen der Themes sehen
  -- Autoload: Name in astroui.lua eintragen
  { "olimorris/onedarkpro.nvim", lazy = true },
  { "sainnhe/everforest", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
    opts = {
      terminal_colors = true,
      devicons = true, -- highlight the icons of `nvim-web-devicons`
      filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
      plugins = {
        indent_blankline = {
          context_highlight = "pro", -- default | pro
          context_start_underline = false,
        },
      },
    },
  },
}
