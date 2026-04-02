vim.pack.add({
  -- Colorscheme
  { src = "https://github.com/folke/tokyonight.nvim" },
  -- Buffer
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
})

-- Colorscheme
vim.cmd.colorscheme("tokyonight")

-- Buffer
require("bufferline").setup({
  options = {
    close_command = function (bufnr)
      vim.cmd("bdelete " .. bufnr)
    end,

    -- nvim-tree, show File Explorer
    offsets = {
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left",
    },

    -- use nvim lsp
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,

    -- Show LSP error/warning/hint/info icons
    diagnostics_indicator = function(_, _, diag)
      local icons = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      }
      local ret = (diag.error and icons.Error .. diag.error .. " " or "")
        .. (diag.warning and icons.Warn .. diag.warning or "")
      return vim.trim(ret)
    end,

    -- Show Filetype icos
    get_element_icon = function (opts)
      -- fallback to nvim-web-devicons if available
      local ok, devicons = pcall(require, "nvim-web-devicons")
      if ok then
        local icon, _ = devicons.get_icon_by_filetype(opts.filetype)
        return icon
      end
      return " "
    end
  },
})

-- Buffer keybindings
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
