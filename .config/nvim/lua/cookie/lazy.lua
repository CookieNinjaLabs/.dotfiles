local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- Latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'cookie.plugins' },
  { import = 'cookie.plugins.lsp' },
  -- {
  --   ui = {
  --     cmd = '⌘',
  --     config = '🛠',
  --     event = '📅',
  --     ft = '📂',
  --     init = '⚙',
  --     keys = '🗝',
  --     plugin = '🔌',
  --     runtime = '💻',
  --     require = '🌙',
  --     source = '📄',
  --     start = '🚀',
  --     task = '📌',
  --     lazy = '💤 ',
  --   },
  -- },
  {
    'leaf_syntax',
    dir = '~/.config/nvim/lua/leaf_syntax',
    lazy = false,
  },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
})
