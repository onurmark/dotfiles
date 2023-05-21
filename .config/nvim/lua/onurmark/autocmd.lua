local group = vim.api.nvim_create_augroup("SmashThatLikeButton", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  command = "setlocal shiftwidth=4 tabstop=4 noexpandtab",
  group = group
})
