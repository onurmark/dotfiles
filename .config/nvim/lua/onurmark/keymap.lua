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
set.mouse = ''

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- move to window
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- window
map('n', '<Leader>wh', '<c-w>h')
map('n', '<Leader>wj', '<c-w>j')
map('n', '<Leader>wk', '<c-w>k')
map('n', '<Leader>wl', '<c-w>l')
map('n', '<Leader>wd', '<c-w>q')
map('n', '<Leader>wv', ':vsplit<CR>')
map('n', '<Leader>wx', ':split<CR>')

-- resize windows 
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- buffer
map('n', '<Leader>bd', ':bprevious <bar> bdelete #<CR>')
map('n', '<Leader>bn', ':bnext<CR>')
map('n', '<Leader>bp', ':bprevious<CR>')
map('n', '<Leader>b<Tab>', ':buffer #<CR>')

-- Move Lines
map("n", "<Leader>n", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<Leader>p", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("v", "<Leader>n", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<Leader>p", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map('n', '<Leader><Tab>', ':ClangdSwitchSourceHeader<CR>')

vim.api.nvim_create_user_command('Make', 'wa | make <args> | cwindow 3', { nargs = '*' })

map('n', '<space>e', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<space>q', vim.diagnostic.setloclist)
