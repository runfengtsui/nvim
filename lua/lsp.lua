vim.lsp.enable({
  'lua_ls',
  'clangd',
  'pyright',
  'marksman',
  'julials',
})

vim.keymap.set('n', 'gh', vim.lsp.buf.hover)

