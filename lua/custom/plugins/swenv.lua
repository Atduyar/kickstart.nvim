return {
  "linux-cultist/venv-selector.nvim",
  enabled = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = false,
  opts = {
  }
}
