if vim.g.vscode then return end

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require('nvim-treesitter').install {
  'lua', 'vim', 'bash', 'fish',
  'markdown', 'markdown_inline',
  'python', 'julia', 'matlab', 'cpp', 'c',
}
