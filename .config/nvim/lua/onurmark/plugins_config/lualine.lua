require('lualine').setup {
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
  }
}
