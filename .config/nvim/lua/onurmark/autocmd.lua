local group = vim.api.nvim_create_augroup("SmashThatLikeButton", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  command = "setlocal shiftwidth=4 tabstop=4 noexpandtab",
  group = group
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.h",
  command = "setlocal filetype=c",
  group = group
})

