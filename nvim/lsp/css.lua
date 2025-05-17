return {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	init_options = { provideFormatter = true },
	root_markers = { "packages.json" },
	single_file_support = true,
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
}
