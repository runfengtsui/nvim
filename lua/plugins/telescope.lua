if vim.g.vscode then return end

vim.pack.add({
  -- Telescope
  "https://github.com/nvim-telescope/telescope.nvim",
  -- Dependencies
  "https://github.com/nvim-lua/plenary.nvim",
})

-- Keybindings
local builtin = require("telescope.builtin")
vim.keymap.set(
  'n', "<leader>ff", builtin.find_files, { desc = "Telescope find files" }
)
vim.keymap.set(
  'n', "<leader>fb", builtin.buffers, { desc = "Telescope buffers" }
)
vim.keymap.set(
  'n', "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" }
)
vim.keymap.set(
  'n', "<leader>fc", "<cmd>Telescope command_history<cr>",
  { desc = "Command histories" }
)

-- Setup
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        -- Telsescope exit
        ["<esc>"] = actions.close,
        -- next selection
        ["<C-j>"] = actions.move_selection_next,
        ["<Tab>"] = false,
        -- previous selection
        ["<C-k>"] = actions.move_selection_previous,
        ["<S-Tab>"] = false,
      },
    },
  }
}
