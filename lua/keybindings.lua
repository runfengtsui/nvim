-- Leader Key
vim.g.mapleader = " " vim.g.maplocalleader = " "

local map = vim.keymap.set
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- <Esc>
map("i", "jk", "<Esc>", opt)
map("n", ";", ":", opt)

-- 取消 s 默认功能(删除一个字符转入插入模式)
map("n", "s", "", opt)
-- split window
map("n", "sv", "<cmd>vsp<CR>", opt)
map("n", "sh", "<cmd>sp<CR>", opt)

-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)

-- Alt + hjkl 窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)

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

-- bufferline
-- 左右 Tab 切换
map("n", "tp", ":BufferLineCyclePrev<CR>", opt)
map("n", "tn", ":BufferLineCycleNext<CR>", opt)
-- close buffer, provided by `moll/vim-bbye`
map("n", "<leader>q", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- open/close nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)

-- 插件快捷键
local pluginKeys = {}
-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

return pluginKeys

