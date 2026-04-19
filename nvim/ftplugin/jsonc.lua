local opt = vim.opt_local

opt.commentstring = "// %s"
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true

-- Treesitter folding (since you use manual json.so)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
