vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

vim.api.nvim_create_user_command("XmakeBuild", function ()
  vim.api.nvim_exec2("!xmake build", {})
end, {})
vim.api.nvim_create_user_command("XmakeRun", function ()
  vim.api.nvim_exec2("!xmake run", {})
end, {})

