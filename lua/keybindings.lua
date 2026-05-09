-- Leader Key
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

if vim.g.vscode then
  local code = require("vscode")
  vim.keymap.set('n', "<leader>p", function ()
    code.action("workbench.action.showCommands")
  end, { noremap = true, silent = true, desc = "Show commands"})
  -- Sidebar
  vim.keymap.set('n', "<leader>e", function ()
    code.action("workbench.view.explorer")
  end, { noremap = true, silent = true, desc = "Open the explorer"})
  vim.keymap.set('n', "<leader>x", function ()
    code.action("workbench.view.extensions")
  end, { noremap = true, silent = true, desc = "Show the extensions"})
  -- Terminal
  vim.keymap.set('n', "<leader>t", function ()
    code.action("workbench.action.terminal.toggleTerminal")
  end, { noremap = true, silent = true, desc = "Toggle terminal" })
  -- Move to Window
  vim.keymap.set('n', "<leader>h", function ()
    code.action("workbench.action.focusLeftGroup")
  end, { desc = "Move to left window" })
  vim.keymap.set('n', "<leader>j", function ()
    code.action("workbench.action.focusBelowGroup")
  end, { desc = "Move to below window" })
  vim.keymap.set('n', "<leader>k", function ()
    code.action("workbench.action.focusAboveGroup")
  end, { desc = "Move to above window" })
  vim.keymap.set('n', "<leader>l", function ()
    code.action("workbench.action.focusRightGroup")
  end, { desc = "Move to right window" })
else
  -- 取消 s 默认功能(删除一个字符转入插入模式)
  vim.keymap.set('n', 's', "", { noremap = true, silent = true })
  -- <Esc>
  vim.keymap.set('i', "jk", "<ESC>", { desc = "Back to normal mode" })
  -- Terminal
  vim.keymap.set('t', "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
  vim.keymap.set('n', "<leader>t", ":split | terminal<CR>", {
    noremap = true, silent = true, desc = "Split window and open terminal"
  })
  vim.keymap.set('t', "<leader>h", "<cmd>wincmd h<CR>", {
    noremap = true, silent = true
  })
  vim.keymap.set('t', "<leader>j", "<cmd>wincmd j<CR>", {
    noremap = true, silent = true
  })
  vim.keymap.set('t', "<leader>k", "<cmd>wincmd k<CR>", {
    noremap = true, silent = true
  })
  vim.keymap.set('t', "<leader>l", "<cmd>wincmd l<CR>", {
    noremap = true, silent = true
  })
  -- https://github.com/akinsho/toggleterm.nvim?tab=readme-ov-file#sending-lines-to-the-terminal
  -- Set `trim_spaces=false` for sending to REPLs for whitespace-sensitive languages like python.
  local trim_spaces = false
  vim.keymap.set({ 'i', 'n' }, "<S-CR>", function ()
    require("toggleterm").send_lines_to_terminal(
      "single_line", trim_spaces, { args = vim.v.count }
    )
  end, { desc = "Send single line to ToggleTerm" })
  vim.keymap.set('v', "<S-CR>", function ()
    require("toggleterm").send_lines_to_terminal(
      "visual_lines", trim_spaces, { args = vim.v.count }
    )
  end, { desc = "Send multiple lines to ToggleTerm in visual mode" })
  -- Explorer
  vim.keymap.set('n', "<leader>e", ":NvimTreeToggle<CR>", {
    noremap = true, silent = true, desc = "Toggle the explorer"
  })
  -- Window
  -- Move to Window
  vim.keymap.set('n', "<leader>h", "<C-W>h", { desc = "Move to left window" })
  vim.keymap.set('n', "<leader>j", "<C-W>j", { desc = "Move to below window" })
  vim.keymap.set('n', "<leader>k", "<C-W>k", { desc = "Move to above window" })
  vim.keymap.set('n', "<leader>l", "<C-W>l", { desc = "Move to right window" })
  -- 左右比例控制
  vim.keymap.set('n', "s,", "<cmd>vertical resize -4<CR>", {
    noremap = true, silent = true
  })
  vim.keymap.set('n', "s.", "<cmd>vertical resize +4<CR>", {
    noremap = true, silent = true
  })
  -- 上下比例
  vim.keymap.set('n', "sj", "<cmd>resize +4<CR>", {
    noremap = true, silent = true
  })
  vim.keymap.set('n', "sk", "<cmd>resize -4<CR>", {
    noremap = true, silent = true
  })
  -- 等比例
  vim.keymap.set('n', "s=", "<C-w>=", {
    noremap = true, silent = true
  })
end

-- Split window 
vim.keymap.set('n', "<leader>-", "<C-W>s", {
  desc = "Split window horizontally", remap = true
})
vim.keymap.set('n', "<leader>=", "<C-W>v", {
  desc = "Split window vertically", remap = true
})
-- Delete window
vim.keymap.set('n', "<leader>wd", "<C-W>c", {
  desc = "Delete Window", remap = true
})

-- 上下滚动浏览
-- ctrl u / ctrl + d  只移动12行，默认移动半屏
vim.keymap.set('n', "<C-u>", "12k", { noremap = true, silent = true })
vim.keymap.set('n', "<C-d>", "12j", { noremap = true, silent = true })
-- visual模式下缩进代码
vim.keymap.set('v', "<", "<gv", { noremap = true, silent = true })
vim.keymap.set('v', ">", ">gv", { noremap = true, silent = true })
-- 上下移动选中文本
vim.keymap.set('v', "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true})
vim.keymap.set('v', "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true})
