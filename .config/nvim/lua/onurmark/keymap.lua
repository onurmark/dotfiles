vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local set = vim.opt
local map = vim.keymap.set

set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
set.number = true
set.relativenumber = true
set.cursorline = true
set.cindent = true
set.autoindent = true
set.smartindent = true
set.backspace = '2'
set.hlsearch = true
set.incsearch = true
set.diffopt ='vertical'
set.wildmenu = true
set.wildmode = 'list:longest,full'
set.path:append('./**')
set.list = true
set.listchars='tab:→ ,extends:›,precedes:‹,nbsp:·,trail:·'
set.showbreak = '\\'
set.visualbell = true
set.hidden = true
set.splitright = true
set.splitbelow = true
set.showcmd = true
set.laststatus = 2
set.autoread = true
set.tabstop = 2
set.shiftwidth = 2
set.shiftround = true
set.expandtab = true
set.smarttab = true
set.colorcolumn = '80'

map('n', '<leader>h', ':nohlsearch<CR>')

map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

map('n', '<Leader>bd', ':bdelete<CR>')
map('n', '<Leader>bn', ':bnext<CR>')
map('n', '<Leader>bp', ':bprevious<CR>')
map('n', '<Leader>b<Tab>', ':buffer #<CR>')

map('n', '<Leader><Tab>', ':ClangdSwitchSourceHeader<CR>')

vim.api.nvim_create_user_command('Make', 'wa | make <args> | cwindow 3', { nargs = '*' })
