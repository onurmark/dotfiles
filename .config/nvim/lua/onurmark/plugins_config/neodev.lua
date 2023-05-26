local ok, neodev = pcall(require, 'neodev')

if not ok then
  return
end

neodev.setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
