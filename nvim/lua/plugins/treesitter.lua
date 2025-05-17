return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			indent = { enable = true },
			auto_install = false,
			ensure_installed = {
				"vim",
				"vimdoc",
				"markdown",
				"bash",
				"lua",
				"toml",
				"json",
				"css",
				"xml",
				"jsonc",
				"dockerfile",
				"go",
			},
			highlight = { enable = true, additional_vim_regex_highlighting = true },
		})
	end,
}
