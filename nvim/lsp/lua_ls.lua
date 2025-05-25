return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { "init.lua", ".luarc.json" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT", -- Neovim uses LuaJIT
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" }, -- Recognize 'vim' as a global variable
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
				checkThirdParty = false, -- Avoid prompts for third-party libraries
			},
      hint = {
        enable = true,
      },
		},
	},
}
