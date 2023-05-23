local ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if not ok then
  return
end

treesitter.setup {
  ensure_installed = { 'c', 'lua', 'vim' },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
