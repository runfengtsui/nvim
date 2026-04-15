-- require("plugins.nvim-tree"),
-- require("plugins.lualine"),
vim.pack.add({
  -- Markdown
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

require("plugins.completion")
require("plugins.toggleterm")
require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.latex")
