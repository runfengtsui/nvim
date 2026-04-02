vim.pack.add({
  -- LSP
  { src = "https://github.com/neovim/nvim-lspconfig" },
  -- Diagnostics
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
})

vim.lsp.enable({
  "lua_ls",
  "clangd",
  "pyright",
  "marksman",
  "julials",
})

vim.keymap.set("n", "gh", vim.lsp.buf.hover)
-- Rename variable
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
-- Code action
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
-- go xx
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
-- Diagnostic
vim.keymap.set("n", "gp", vim.diagnostic.open_float)
vim.keymap.set("n", "gk", vim.diagnostic.goto_prev)
vim.keymap.set("n", "gj", vim.diagnostic.goto_next)
-- Unused
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
-- vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition)
