-- require("plugins.nvim-tree"),
-- require("plugins.lualine"),
vim.pack.add({
  -- Markdown
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  -- LaTeX
  { src = "https://github.com/lervag/vimtex" },
})

require("plugins.completion")
require("plugins.toggleterm")
require("plugins.nvim-treesitter")
require("plugins.telescope")
