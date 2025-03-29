local disable_auto_comment = vim.api.nvim_create_augroup("DISABLE_AUTO_COMMENT", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*",
  group = disable_auto_comment,
  callback = function ()
    vim.opt_local.formatoptions = vim.opt_local.formatoptions - {"r", "c", "o"}
  end
})

-- Autosave
-- https://github.com/brianhuster/autosave.nvim
local autosave = vim.api.nvim_create_augroup("AUTOSAVE", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "TextChangedI" }, {
  pattern = "*",
  group = autosave,
  callback = function ()
    local modified = vim.api.nvim_eval("&modified")
    local modifiable = vim.api.nvim_eval("&modifiable")
    if modified and modifiable then
      vim.api.nvim_exec2("silent! write", {})
    end
  end
})

-- Terminal
local terminal = vim.api.nvim_create_augroup("TERMINAL", { clear = true })
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = "*",
  group = terminal,
  callback = function ()
    -- 打开终端后自动进入插入模式
    vim.api.nvim_exec2("startinsert", {})
  end
})
vim.api.nvim_create_autocmd({ "TermClose" }, {
  pattern = "*",
  group = terminal,
  callback = function ()
    -- 退出终端后自动关闭 buffer
    vim.api.nvim_exec2("bd!", {})
  end
})

