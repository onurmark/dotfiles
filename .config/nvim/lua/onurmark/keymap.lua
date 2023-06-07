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
set.diffopt = 'vertical'
set.wildmenu = true
set.wildmode = 'list:longest,full'
set.path:append('./**')
set.listchars = 'tab:→ ,extends:›,precedes:‹,nbsp:·,trail:·'
set.list = true
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
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", {
  desc = "Escape and clear hlsearch"
})

-- move to window
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- window
map('n', '<Leader>wh', '<c-w>h', {
  desc = "Move cursor to left window"
})
map('n', '<Leader>wj', '<c-w>j', {
  desc = "Move cursor to down window"
})
map('n', '<Leader>wk', '<c-w>k', {
  desc = "Move cursor to up window"
})
map('n', '<Leader>wl', '<c-w>l', {
  desc = "Move cursor to right window"
})
map('n', '<Leader>wd', '<c-w>q', {
  desc = "close window"
})
map('n', '<Leader>wv', ':vsplit<CR>', {
  desc = "Vertical split window"
})
map('n', '<Leader>wx', ':split<CR>', {
  desc = "Horizontal split window"
})

local change_winsize = function(d)
  local v = vim.api

  -- Lua version of a ternery operator
  d = d and d or "left"

  local lr = d == "left" or d == "right"
  -- 5 for left right, 3 for up down
  local amt = lr and 5 or 3

  local pos = v.nvim_win_get_position(0)
  local w = v.nvim_win_get_width(0)
  local h = v.nvim_win_get_height(0)

  if lr then
    amt = pos[2] == 0 and -amt or amt
  else
    amt = pos[1] == 0 and -amt or amt
  end

  w = (d == "left") and (w + amt) or (w - amt)
  h = (d == "up") and (h + amt) or (h - amt)

  if lr then
    v.nvim_win_set_width(0, w)
  else
    v.nvim_win_set_height(0, h)
  end
end

-- resize windows
map("n", "<S-Up>", function()
  change_winsize("up")
end, {
  desc = "Increase window height"
})
map("n", "<S-Down>", function()
  change_winsize("down")
end, {
  desc = "Decrease window height"
})
map("n", "<S-Left>", function()
  change_winsize("left")
end, {
  desc = "Decrease window width"
})
map("n", "<S-Right>", function()
  change_winsize("right")
end, {
  desc = "Increase window width"
})

-- buffer
map('n', '<Leader>bd', ':bprevious <bar> bdelete #<CR>', {
  desc = "Close buffer",
  silent = true
})
map('n', '<Leader>bn', ':bnext<CR>', {
  desc = "Open next buffer",
  silent = true
})
map('n', '<Leader>bp', ':bprevious<CR>', {
  desc = "Open previous buffer",
  silent = true
})
map('n', '<Leader>b<Tab>', ':buffer #<CR>', {
  desc = "Open recently buffer",
  silent = true
})

-- Move Lines
map("v", "<C-n>", ":m '>+1<cr>gv=gv", {
  desc = "Move lines down"
})
map("v", "<C-p>", ":m '<-2<cr>gv=gv", {
  desc = "Move lines up"
})

-- Switch c source / header
map('n', '<Leader><Tab>', ':ClangdSwitchSourceHeader<CR>', {
  desc = "Switch source/header",
  silent = true
})

-- Diagnostic
map('n', '<Leader>ee', vim.diagnostic.open_float, {
  desc = "Float diagnostic"
})
map('n', '<Leader>ep', vim.diagnostic.goto_prev, {
  desc = "Go to previous diagnostic"
})
map('n', '<Leader>en', vim.diagnostic.goto_next, {
  desc = "Go to next diagnostic"
})
map('n', '<Leader>eq', vim.diagnostic.setloclist, {
  desc = "Open diagnostic location list"
})

vim.api.nvim_create_user_command('Make', 'wa | make <args> | cwindow 3', { nargs = '*' })
vim.api.nvim_create_user_command('Mesonc', 'wa | :!meson compile -C <args>', { nargs = '*' })
vim.api.nvim_create_user_command('Mesont', 'wa | :!meson test -C <args>', { nargs = '*' })
