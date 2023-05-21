vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backspace = '2'
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.diffopt ='vertical'
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest,full'
vim.opt.path:append('./**')
vim.opt.list = true
vim.opt.listchars='tab:→ ,extends:›,precedes:‹,nbsp:·,trail:·'
vim.opt.showbreak = '\\'
vim.opt.visualbell = true
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autoread = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.colorcolumn = '80'

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')
