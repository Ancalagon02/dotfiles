return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>d", group = "Debug" },
      { "<leader>v", group = "LSP" },
      { "<leader>f", group = "Find" },
      { "<leader>c", group = "Comments" },
      { "<leader>e", group = "Edit" },
      { "<leader>w", group = "Window" },
		})
	end,
}
