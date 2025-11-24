vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

local function baltamcmd()
  local baltam
  -- https://cloud.tencent.com/developer/ask/sof/107177575
  if vim.loop.os_uname().sysname == "Windows_NT" then
    baltam = "baltamaticaCLI.exe "
  elseif vim.loop.os_uname().sysname == "Linux" then
    baltam = "baltamatica.sh -nodesktop "
  end
  return baltam
end

-- custom baltamatica terminal
vim.keymap.set("n", "<leader>t", function ()
  local Terminal = require('toggleterm.terminal').Terminal
  local baltamterm = Terminal:new({
    cmd = baltamcmd(),
    direction = 'vertical',
  })
  baltamterm:toggle()
end, { noremap = true, silent = true })

-- Run Baltamatica file
vim.keymap.set("n", "<F5>", function ()
  vim.api.nvim_command(
    "!" .. baltamcmd() .. "-m " .. vim.fn.expand('%')
  )
end, { noremap = true, silent = true })

