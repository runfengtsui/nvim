if vim.g.vscode then return end

-- Colorscheme
vim.pack.add({
  "https://github.com/folke/tokyonight.nvim"
})
vim.cmd.colorscheme("tokyonight")

vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons"
})

local devicons = require("nvim-web-devicons")
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

  for i, tab in ipairs(tabs) do
    local is_current = (tab == current)

    -- Get the filename
    local wins = vim.api.nvim_tabpage_list_wins(tab)
    -- buffer of first window in tab
    local bufnr = vim.api.nvim_win_get_buf(wins[1])
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local filename = vim.fn.fnamemodify(bufname, ":t")
    if filename == "" then filename = "[No Name]" end

    -- Set the tabline string
    local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
    local icon, icon_hl = devicons.get_icon(filename, ft)

    -- Determine if this tab is the current one
    local hl = is_current and "%#TabLineSel#" or "%#TabLine#"

    -- Build the label with devicon and filename
    local label = " " .. (icon or " ") .. " " .. filename .. " "

    -- Add diagnostic counts
    local diag_label = ""
    if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
      local diag_counts = { Error = 0, Warn = 0, Info = 0, Hint = 0 }
      local diagnostics = vim.diagnostic.get(bufnr)
      for _, d in ipairs(diagnostics) do
        if d.severity == vim.diagnostic.severity.ERROR then
          diag_counts.error = diag_counts.error + 1
        elseif d.severity == vim.diagnostic.severity.WARN then
          diag_counts.warn = diag_counts.warn + 1
        elseif d.severity == vim.diagnostic.severity.INFO then
          diag_counts.info = diag_counts.info + 1
        elseif d.severity == vim.diagnostic.severity.HINT then
          diag_counts.hint = diag_counts.hint + 1
        end
      end

      -- Build diagnostics part only for non-zero counts
      for severity, count in pairs(diag_counts) do
        if count > 0 then
          local hl_group = "Diagnostic" .. severity:sub(1,1):upper() .. severity:sub(2)
          diag_label = diag_label .. "%#" .. hl_group .. "#" .. icons[severity] .. count .. " %*"
        end
      end
    end

    s = s .. hl .. label .. diag_label
  end

  -- Fill the rest of the tabline with the default background
  s = s .. "%#TabLineFill#%T"
  return s
end
