vim.pack.add {
  "https://github.com/catppuccin/nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://codeberg.org/mfussenegger/nvim-dap",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
  "https://github.com/mfussenegger/nvim-dap-python",
  "https://github.com/leoluz/nvim-dap-go",
}

require("plugins.telescope")
require("plugins.which-key")
require("plugins.lualine")
require("plugins.nvim-dap")

vim.cmd.colorscheme("catppuccin")
