-- Leader Key
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

local map = vim.keymap.set
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- <Esc>
map("i", "jk", "<ESC>", { desc = "Back to normal mode" })

-- 取消 s 默认功能(删除一个字符转入插入模式)
map("n", "s", "", opt)

-- Window
-- Move to Window
map("n", "<leader>h", "<C-W>h", { desc = "Move to left window" })
map("n", "<leader>j", "<C-W>j", { desc = "Move to below window" })
map("n", "<leader>k", "<C-W>k", { desc = "Move to above window" })
map("n", "<leader>l", "<C-W>l", { desc = "Move to right window" })
-- Split window 
map("n", "<leader>-", "<C-W>s", { desc = "Split window horizontally", remap = true })
map("n", "<leader>=", "<C-W>v", { desc = "Split window vertically", remap = true })
-- Delete window
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- Buffer
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })

-- 左右比例控制
map("n", "s,", "<cmd>vertical resize -4<CR>", opt)
map("n", "s.", "<cmd>vertical resize +4<CR>", opt)
-- 上下比例
map("n", "sj", "<cmd>resize +4<CR>", opt)
map("n", "sk", "<cmd>resize -4<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- 上下滚动浏览
-- ctrl u / ctrl + d  只移动12行，默认移动半屏
map("n", "<C-u>", "12k", opt)
map("n", "<C-d>", "12j", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- My Personal Terminal
map("n", "<leader>t", ":split term://fish<CR>", opt)

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", opt)
-- 为了方便, 将启动终端条件下和分屏一致
map("t", "<leader>h", "<cmd>wincmd h<CR>", opt)
map("t", "<leader>j", "<cmd>wincmd j<CR>", opt)
map("t", "<leader>k", "<cmd>wincmd k<CR>", opt)
map("t", "<leader>l", "<cmd>wincmd l<CR>", opt)
-- https://github.com/akinsho/toggleterm.nvim?tab=readme-ov-file#sending-lines-to-the-terminal
-- Set `trim_spaces=false` for sending to REPLs for whitespace-sensitive languages like python.
local trim_spaces = false
map({ "i", "n" }, "<S-CR>", function ()
  require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)
map("v", "<S-CR>", function ()
  require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = vim.v.count })
end)

-- open/close nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)

