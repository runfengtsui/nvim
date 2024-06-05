local disable_auto_comment = vim.api.nvim_create_augroup("DISABLE_AUTO_COMMENT", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*",
  group = disable_auto_comment,
  callback = function ()
    vim.opt_local.formatoptions = vim.opt_local.formatoptions - {"r", "c", "o"}
  end
})

