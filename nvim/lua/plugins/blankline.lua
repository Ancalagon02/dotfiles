return {
	"lukas-reineke/indent-blankline.nvim",
	main = "libl",
	config = function()
		require("ibl").setup({
			scope = { enabled = true },
		})
	end,
}
