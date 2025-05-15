return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()

    local myshell = function ()
      if vim.loop.os_uname().sysname == "Windows_NT" then
        return vim.o.shell
      elseif vim.loop.os_uname().sysname == "Linux" then
        return "/usr/bin/fish"
      end
    end

    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.45
        end
      end,
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      direction = "horizontal",
      shell = myshell,
    })
  end
}

