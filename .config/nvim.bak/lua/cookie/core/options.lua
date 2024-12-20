vim.cmd 'let g:netrw_liststyle = 3'

vim.g.have_nerd_font = true

local opt = vim.opt

-- Make line numbers default
opt.number = true
-- Make line numbers relative
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Copy indent from current line
opt.breakindent = true

opt.wrap = false -- No visual text wrapping

-- Search settings
opt.ignorecase = true -- Makes the search case insensitive
opt.smartcase = true -- In mixed case situations the search will be case-sensitive

opt.cursorline = true -- Show which line your cursor is on

-- Turn on termguicolors
opt.termguicolors = true
opt.background = 'dark' -- Choose dark mode if light and dark are available
opt.signcolumn = 'yes' -- Show sign column so that text doesn't shift

-- Backspace
opt.backspace = 'indent,eol,start' -- Allow backspace on indent, end of line, or insert mode start position

-- Clipboard
opt.clipboard:append 'unnamedplus' -- Use system clipboard as default

-- Split windows
opt.splitright = true -- Split vertical to the right
opt.splitbelow = true -- Split horizontal to the bottom

opt.undofile = true -- Save undo history
opt.updatetime = 250
opt.timeoutlen = 300

opt.list = true
opt.listchars = { tab = '⇢ ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- textwrap at 80  cols
opt.tw = 80

opt.wildmenu = true
opt.wildmode = 'list:longest,list:full'
