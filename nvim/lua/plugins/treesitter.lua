return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      indent = { enable = true },
      auto_install = false,
      hightlight = { enable = true, additional_vim_regex_highlighting = true },
      ensure_installed = { "vim", "markdown", "bash", "lua", "toml", "json", "css", "xml", "jsonc" }
    })
  end
}
