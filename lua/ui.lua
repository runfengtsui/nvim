if vim.g.vscode then return end

-- Colorscheme
vim.pack.add({
  "https://github.com/folke/tokyonight.nvim"
})
vim.cmd.colorscheme("tokyonight")

vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons"
})

local icons = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}
vim.o.tabline = "%!v:lua.PillTabline()"

function PillTabline()
  local s = ""
  local tabs = vim.api.nvim_list_tabpages()
  local current = vim.api.nvim_get_current_tabpage()

  for _, tab in ipairs(tabs) do
    local wins = vim.api.nvim_tabpage_list_wins(tab)
    -- buffer of first window in tab
    local bufnr = vim.api.nvim_win_get_buf(wins[1])
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local filename = vim.fn.fnamemodify(bufname, ":t")
    local ft = vim.fn.fnamemodify(bufname, ":e")
    if filename == "" then filename = "[No Name]" end
    -- fix: the get_icon function need the extension not the filetype.
    local icon, _ = require("nvim-web-devicons").get_icon(filename, ft)
    -- Determine if this tab is the current one
    local hl = (tab == current) and "%#TabLineSel#" or "%#TabLine#"
    -- Build the label with devicon and filename
    local label = " " .. (icon or " ") .. " " .. filename .. " "
    s = s .. hl .. label
  end

  -- Fill the rest of the tabline with the default background
  s = s .. "%#TabLineFill#%T"
  return s
end
