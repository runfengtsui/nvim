vim.pack.add({
  -- CMP
  { src = "https://github.com/saghen/blink.lib" },
  { src = "https://github.com/saghen/blink.cmp" },
  -- LuaSnip
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  -- Autopairs
  { src = "https://github.com/windwp/nvim-autopairs" },
})

-- Lazy load
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  group = vim.api.nvim_create_augroup("SetupCompletion", { clear = true }),
  once = true,
  callback = function ()
    require("nvim-autopairs").setup {
      disable_filetype = { "tex" },
    }

    local cmp = require("blink.cmp")
    cmp.build():wait(6000)
    cmp.setup({
      keymap = {
        -- Disable built-in keybindings
        preset = 'none',
        -- Custtom keybindings
        ['<cr>'] = { 'select_and_accept', 'fallback' },
        ['<tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<s-tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        -- Default scroll documentation keybinding
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      },
      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = { auto_show = false }
      },
      -- Use LuaSnip for snippets
      snippets = { preset = 'luasnip' },
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      -- Fuzzy matcher for typo resistance and significantly better performance
      fuzzy = { implementation = "lua" },

    })

    require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.fn.stdpath("config") .. "/LuaSnips",
    })
  end
})
