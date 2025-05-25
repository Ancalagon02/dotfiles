return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
            ['<C-q>'] = function(prompt_bufnr)
              require('telescope.actions').send_to_qflist(prompt_bufnr) -- Pass prompt_bufnr
              vim.cmd('cclose')
            end,
            ['<M-q>'] = function(prompt_bufnr)
              require('telescope.actions').send_selected_to_qflist(prompt_bufnr) -- Pass prompt_bufnr
              vim.cmd('cclose')
            end,
          },
        },
			},
			pickers = {
				find_files = {
					file_ignore_patterns = { ".git" },
					hidden = true,
				},
			},
			extensions = {
				"fzf",
			},
		})
		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })

	end,
}
