vim.pack.add {
  "https://github.com/catppuccin/nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
}

require("plugins.telescope")
require("plugins.which-key")
require("plugins.lualine")

vim.cmd.colorscheme("catppuccin")
