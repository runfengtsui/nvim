return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.opt.termguicolors = true
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
        end,
      }
    })
  end,
}
