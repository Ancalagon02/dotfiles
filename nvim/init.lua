vim.g.mapleader = " "


require("config.global")
require("config.options")
require("plugins")
require("core.autocmds")
require("core.lsp_builtin")
require("config.keybind")

vim.filetype.add({
	pattern = {
		[".*/hypr/.*%.conf"] = "hyprlang",
		[".*/hyprland%.conf"] = "hyprlang",
	},
})


