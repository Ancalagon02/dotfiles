local config = {
  build = ":TSUpdate",
  auto_install = false,
  hightlight = { enable = true, additional_vim_regex_highlighting = true },
  ensure_installed = { "vim", "markdown", "bash", "lua", "toml" }
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = config,
}
