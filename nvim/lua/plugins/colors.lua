return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				highlight_overrides = {
					all = function(c)
						return { Operator = { fg = "#008000" }, ["@keyword.return"] = { fg = c.red } }
					end,
				},
				flavour = "mocha",
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = {},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})
		end,
	},
	{
		"neanias/everforest-nvim",
	},
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"ellisonleao/gruvbox.nvim",
	},
}
