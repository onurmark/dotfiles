local ok, gruvbox = pcall(require, 'gruvbox')

if not ok then
  return
end

gruvbox.setup()

vim.o.termguicolors = true
vim.cmd([[ colorscheme gruvbox ]])
