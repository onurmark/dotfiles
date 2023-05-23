local ok, lualine = pcall(require, 'lualine')

if not ok then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
  },
  selections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  },
  tabline = {
    lualine_a = {'buffers'}
  }
}
