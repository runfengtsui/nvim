if vim.g.vscode then return end

vim.pack.add({
  { src = "https://github.com/akinsho/toggleterm.nvim" },
})

require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.45
    end
  end,
  open_mapping = [[<c-\>]],
  start_in_insert = true,
  direction = "horizontal",
  shell = vim.o.shell,
})
