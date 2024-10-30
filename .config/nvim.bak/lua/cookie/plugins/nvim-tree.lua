return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local nvimtree = require 'nvim-tree'
    local devicons = require 'nvim-web-devicons'

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Add custom icon for .leaf files
    devicons.set_icon {
      leaf = {
        icon = '🍃', -- Your chosen icon glyph
        color = '#8FAA54', -- Icon color in hex
        cterm_color = '113', -- Terminal color code
        name = 'Leaf', -- Unique name for the icon
      },
    }

    nvimtree.setup {
      view = {
        width = 35,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            -- git = {
            --   unstaged = "",
            --   staged = "",
            --   unmerged = "",
            --   renamed = "",
            --   untracked = "",
            --   deleted = "",
            -- },
            folder = {
              arrow_closed = '→', -- arrow when folder is closed
              arrow_open = '↓', -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { '.DS_Store' },
      },
      git = {
        ignore = false,
      },
    }
  end,
}
