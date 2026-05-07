local M = {}

-- Functions to detect the current platform
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local is_linux = vim.loop.os_uname().sysname == "Linux"
local is_mac = vim.loop.os_uname().sysname == "Darwin"

M.is_windows = is_windows
M.is_linux = is_linux
M.is_mac = is_mac

return M
