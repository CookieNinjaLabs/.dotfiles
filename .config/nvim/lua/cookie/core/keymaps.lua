local g = vim.g

g.mapleader = ' ' -- Set the <leader key to space
g.maplocalleader = ' '

local keymap = vim.keymap

-- Copy to Clipboard
keymap.set('v', ',y', '"+y', { desc = 'Copy to Clipboard' })

-- Save
keymap.set('n', '<C-s>', '<cmd>:wa<CR>', { desc = 'Save all files' })
keymap.set('n', '<leader>sa', '<cmd>:wa<CR><cmd>:LspRestart<CR>', { desc = 'Save all files and restart LSP' })
-- keymap.set('n', '<S-s>', '<cmd>:wa<CR>', { desc = 'Save all files' })

-- INSERT-Mode
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with nk' })

-- NORMAL-Mode
keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlight' })
keymap.set('n', '<leader>rl', ':LspRestart<CR>', { desc = 'Clear search highlight' })

-- Increment/decrement numbers
keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' }) -- Increment
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' }) -- Decrement

-- Window management
keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split window horizontally' })
keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Make splits equal size' })
keymap.set('n', '<leader>wx', '<C-w>c', { desc = 'Close current split' })

-- Buffer
keymap.set('n', '<leader>bn', '<cmd>:bnext<CR>', { desc = 'Next buffer' })
keymap.set('n', '<leader>bp', '<cmd>:bprevious<CR>', { desc = 'Previous buffer' })
keymap.set('n', '<leader>bd', '<cmd>:bdelete<CR>', { desc = 'Delete buffer' })

-- Tabs/Bufferline
keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- File Tree
keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' }) -- Toggle file explorer
keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' }) -- Toggle file explorer on current file
keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' }) -- Collapse file explorer
keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' }) -- Refresh file explorer

-- Telescope
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files in cwd' })
keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files' })
keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = 'Find string in cwd' })
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })
keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = 'Find todos' })

-- Auto-Session
keymap.set('n', '<leader>sr', '<cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' }) -- Restore last workspace session for current directory
keymap.set('n', '<leader>ss', '<cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' }) -- Save workspace session for current working directory

--  See `:help wincmd` for a list of all window commands
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Enable Arrowkey navigation
keymap.set('n', '<C-left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-up>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-down>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
