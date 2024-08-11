vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.smartindent = false

-- Run markdown file, i.e., markdown preview
vim.keymap.set("n", "<F5>", function ()
  vim.api.nvim_command("MarkdownPreviewToggle")
end, { noremap = true, silent = true })

