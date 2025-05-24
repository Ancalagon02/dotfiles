return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")
			local widgets = require("dap.ui.widgets")

			require("dapui").setup()
			require("dap-go").setup({

      dap_configurations = {
        {
          -- Must be "go" or it will be ignored by the plugin
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      })


			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint [DAP]" })
			vim.keymap.set("n", "<leader>dg", dap.run_to_cursor, {desc = "Run to cursor [DAP]" })

			-- Eval var under cursor
			vim.keymap.set("n", "<leader>?", function() ui.eval(nil, { enter = true }) end,
        { desc = "Debug Eval under cursor [DAP]" })
			vim.keymap.set("n", "<F1>", dap.continue)
			vim.keymap.set("n", "<F2>", dap.step_into)
			vim.keymap.set("n", "<F3>", dap.step_over)
			vim.keymap.set("n", "<F4>", dap.step_out)
			vim.keymap.set("n", "<F5>", dap.step_back)
			vim.keymap.set("n", "<F13>", dap.restart)
			vim.keymap.set("n", "<leader>dh", function()
				widgets.centered_float(widgets.scopes)
			end, { desc = "Debug open scope window [DAP]" })

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
