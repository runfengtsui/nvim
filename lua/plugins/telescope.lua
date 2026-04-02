vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

-- Keybindings
vim.keymap.set(
  "n", "<leader><space>",
  "<cmd>Telescope find_files<cr>",
  { desc = "Find files" }
)
vim.keymap.set(
  "n", "<leader>:",
  "<cmd>Telescope command_history<cr>",
  { desc = "Command histories" }
)
vim.keymap.set(
  "n", "<leader>,",
  "<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>",
  { desc = "Switch buffers" }
)
