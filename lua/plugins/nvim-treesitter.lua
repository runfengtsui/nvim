return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function ()
    require'nvim-treesitter'.install {
      'lua', 'vim', 'bash', 'fish',
      'markdown', 'markdown_inline',
      'python', 'julia', 'matlab', 'cpp', 'c',
    }
  end,
}
