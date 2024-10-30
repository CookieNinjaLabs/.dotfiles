return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  version = '*',
  config = function()
    local bufferline = require 'bufferline'

    bufferline.setup {
      options = {
        seperator_style = 'slope',
        modified_icon = '🔥',
        show_buffer_icons = true,
        -- color_icons = true,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'Explorer',
            highlight = 'Directory',
            text_align = 'center',
          },
        },
        always_show_bufferline = false,
      },
    }

    vim.cmd 'highlight BufferLineFill guibg=#222436'
  end,
}
