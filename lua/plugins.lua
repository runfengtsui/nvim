-- require("plugins.lualine"),
vim.pack.add({
  -- Markdown
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  -- Autopairs
  'https://github.com/windwp/nvim-autopairs',
})

require("plugins.completion")
require("plugins.toggleterm")
require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.latex")
require("plugins.render-markdown")
