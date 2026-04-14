local telescope = require('telescope')
local actions = require('telescope.actions')

-- 2. Setup with your specific insert-mode mappings
telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})

