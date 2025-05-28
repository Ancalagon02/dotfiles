return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
        python = { "black" },
			},
			vim.keymap.set("n", "<leader>e", function()
				require("conform").format({ bufnr = 0 })
			end, { desc = "Code Format [conform]" }),
		})
	end,
}
