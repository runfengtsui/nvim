return {
  -- Autocompletion
  {
    -- eigine
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      -- sources
      { "hrsh7th/cmp-nvim-lsp" },                 -- { name = nvim_lsp" }
      { "hrsh7th/cmp-buffer" },                   -- { name = "buffer" }
      { "hrsh7th/cmp-path" },                     -- { name = "path" }
      { "hrsh7th/cmp-cmdline" },                  -- { name = "cmdline" }
      { "hrsh7th/cmp-nvim-lsp-signature-help" },  -- { name = "nvim_lsp_signture_help" }
      { "saadparwaiz1/cmp_luasnip" },
      {
        "onsails/lspkind.nvim",
        lazy = false,
        config = function()
          require("lspkind").init({
            mode = "symbol_text",
            preset = "codicons",
            symbol_map = {
              Text = "",
              Method = "",
              Function = "",
              Constructor = "",
              Field = "ﰠ",
              Variable = "",
              Class = "ﴯ",
              Interface = "",
              Module = "",
              Property = "ﰠ",
              Unit = "塞",
              Value = "",
              Enum = "",
              Keyword = "",
              Snippet = "",
              Color = "",
              File = "",
              Reference = "",
              Folder = "",
              EnumMember = "",
              Constant = "",
              Struct = "פּ",
              Event = "",
              Operator = "",
              TypeParameter = "",
            },
          })
        end,
      }
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet eigine
          expand = function(args)
            -- For `luasnip` users.
            luasnip.lsp_expand(args.body)
            -- For nvim-snippet user
            -- vim.snippet.expand(args.body)
          end,
        },
        window = {
          completion = {
            -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
          },
          documentation = cmp.config.window.bordered(),
        },
        -- 补全源
        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            group_index = 1,
          },
          {
            name = "luasnip",
            group_index = 1,
          },
          {
            name = "nvim_lsp_signature_help",
            group_index = 2,
          },
          {
            name = "buffer",
            group_index = 2,
          },
          {
            name = "path",
            group_index = 2,
          },
        }),

        -- 使用 lspkind-nvim 显示类型图标
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol_text",

            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
              -- Source 显示提示来源
              vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
              return vim_item
            end,
          }),
        },
        -- 快捷键设置
        mapping = {
          -- 出现补全
          ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
          -- https://blog.csdn.net/lxyoucan/article/details/120863902
          -- jump to next porition after modify or complete
          ["<C-j>"] = function ()
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            end
          end,
          -- 选择上一个, Lsp 补全和 Luasnip 跳转到上一个节点
          ["<C-k>"] = function ()
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), '')
            end
          end,
          -- abort completion
          ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
          }),
          -- confirm completion
          ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
          }),
          -- 如果窗口内容太多，可以滚动
          ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
          ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        },
      })

      -- Use buffer source for `/` and '?' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- use cmdline and path source for `:`
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path", }
        }, {
            { name = "cmdline", }
          }),
      })

      -- 根据文件类型来选择补全来源
      cmp.setup.filetype({ "tex", "markdown", "help" }, {
        sources = {
          { name = "luasnip" },
          { name = "path", },
        },
      })
    end,
  },
}

