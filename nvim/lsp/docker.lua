return {
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "dockerfile" },
	root_markers = { "dockerfile", ".git"},
	single_file_support = true,
}
