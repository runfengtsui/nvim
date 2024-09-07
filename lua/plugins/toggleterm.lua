return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    -- https://github.com/akinsho/toggleterm.nvim/wiki/Tips-and-Tricks#using-toggleterm-with-powershell
    local powershell_options = {
      shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
      shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
      shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
      shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
      shellquote = "",
      shellxquote = "",
    }
    for option, value in pairs(powershell_options) do
      vim.opt[option] = value
    end

    local myshell = function ()
      if vim.loop.os_uname().sysname == "Windows_NT" then
        return vim.o.shell
      elseif vim.loop.os_uname().sysname == "Linux" then
        return "/usr/local/bin/fish"
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

