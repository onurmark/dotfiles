local ok, nvimtree = pcall(require, 'nvim-tree')

if not ok then
  return
end

nvimtree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 40,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>tn', ':NvimTreeFindFileToggle<CR>')
