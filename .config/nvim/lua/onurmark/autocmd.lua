local function augroup(name)
  return vim.api.nvim_create_augroup("onurmark" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup('c_indent'),
  pattern = "c",
  command = "setlocal shiftwidth=4 tabstop=4 noexpandtab",
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup('typescriptreact_indent'),
  pattern = "typescriptreact",
  command = "setlocal shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup('tsx_indent'),
  pattern = "tsx",
  command = "setlocal shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup('html_indent'),
  pattern = "html",
  command = "setlocal shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup('c_setting'),
  pattern = "*.h",
  command = "setlocal filetype=c",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup('tsx_setting'),
  pattern = "*.tsx",
  command = "setlocal filetype=typescriptreact",
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
