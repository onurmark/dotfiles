local ok, nvimtree = pcall(require, 'nvim-tree')

if not ok then
  return
end

nvimtree.setup()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>tn', ':NvimTreeFindFileToggle<CR>')
