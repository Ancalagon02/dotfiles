return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      build = ":TSUpdate",
      auto_install = false,
      hightlight = { enable = true, additional_vim_regex_highlighting = true },
      ensure_installed = { "vim", "markdown", "bash", "lua", "toml" }
    })
  end
}
