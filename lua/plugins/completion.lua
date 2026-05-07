if vim.g.vscode then return end

vim.pack.add({
  -- CMP
  'https://github.com/saghen/blink.lib',
  'https://github.com/saghen/blink.cmp',
  -- LuaSnip
  'https://github.com/L3MON4D3/LuaSnip',
})

-- Lazy load
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  group = vim.api.nvim_create_augroup("SetupCompletion", { clear = true }),
  once = true,
  callback = function ()
    require('blink.cmp').setup({
      keymap = {
        -- Disable built-in keybindings
        preset = 'none',
        -- Custtom keybindings
        ['<cr>'] = { 'select_and_accept', 'fallback' },
        ['<C-j>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'snippet_backward', 'fallback' },
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
      fuzzy = { implementation = "rust" },
    })

    require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.fn.stdpath("config") .. "/LuaSnips",
    })
  end
})

-- LuaSnip: Change the active choice
local ls = require("luasnip")
vim.keymap.set({"i", "s"}, "<C-P>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {silent = true})
