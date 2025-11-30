vim.lsp.enable({
  'lua_ls',
  'clangd',
  'pyright',
  'marksman',
  'julials',
})

local map = vim.keymap.set
map('n', 'gh', vim.lsp.buf.hover)
-- Rename variable
map('n', '<leader>rn', vim.lsp.buf.rename)
-- Code action
map('n', '<leader>ca', vim.lsp.buf.code_action)
-- go xx
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'gi', vim.lsp.buf.implementation)
map('n', 'gr', vim.lsp.buf.references)
-- Diagnostic
map('n', 'gp', vim.diagnostic.open_float)
map('n', 'gk', vim.diagnostic.goto_prev)
map('n', 'gj', vim.diagnostic.goto_next)
-- Unused
-- map('n', '<leader>q', vim.diagnostic.setloclist)
-- map('n', '<C-k>', vim.lsp.buf.signature_help)
-- map('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
-- map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
-- map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
-- map('n', '<space>D', vim.lsp.buf.type_definition)
