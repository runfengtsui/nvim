vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- Get Julia command if local environment exists.
local function get_julia_command()
  local command = 'julia '
  if vim.fn.filereadable('Project.toml') then
    command = command .. '--project=' .. vim.fn.getcwd() .. ' '
  end
  return command
end

-- Custom Julia terminal using toggleterm.nvim plugin.
vim.keymap.set("n", "<leader>t", function ()
  local Terminal = require('toggleterm.terminal').Terminal
  local juterm = Terminal:new({
    cmd = get_julia_command(),
    direction = 'vertical',
  })
  juterm:toggle()
end, { noremap = true, silent = true })

-- Run Julia file.
vim.keymap.set("n", "<leader>r", function ()
  local command = get_julia_command() .. vim.fn.expand('%')
  vim.cmd('!' .. command)
end, { noremap = true, silent = true })
