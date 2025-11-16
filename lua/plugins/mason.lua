return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  opts = {
    ensure_installed = {
      "lua_ls", "marksman",
      "pyright", "julials", "matlab_ls",
      "clangd",
    },
  },
  dependencies = {
    { "neovim/nvim-lspconfig" },
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      }
    },
  },
}

