return {
  {
    'saghen/blink.cmp',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        config = function ()
          require("luasnip.loaders.from_lua").lazy_load({
            paths = vim.fn.stdpath("config") .. "/LuaSnips",
          })
        end
      },
    },
    version = '1.*',
    opts = {
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
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      -- Use LuaSnip for snippets
      snippets = { preset = 'luasnip' },
      -- Fuzzy matcher for typo resistance and significantly better performance
      fuzzy = { implementation = "lua" },
    },
  },
}

