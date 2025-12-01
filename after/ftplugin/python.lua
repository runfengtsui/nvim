vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- Get Python command if local environment exists.
local function get_python_command()
  local command = 'python3 '
  if vim.fn.filereadable('pyproject.toml') == 1 then
    command = 'poetry run ' .. command
  end
  return command
end

-- Custom Python terminal using toggleterm.nvim plugin.
vim.keymap.set("n", "<leader>t", function ()
  local Terminal = require('toggleterm.terminal').Terminal
  local pyterm = Terminal:new({
    cmd = get_python_command(),
    direction = 'vertical',
  })
  pyterm:toggle()
end, { noremap = true, silent = true })

-- Run Python file
vim.keymap.set('n', '<leader>r', function ()
  local command = get_python_command() .. vim.fn.expand('%')
  vim.cmd('!' .. command)
end, { noremap = true, silent = true })

vim.lsp.enable("pyright")
