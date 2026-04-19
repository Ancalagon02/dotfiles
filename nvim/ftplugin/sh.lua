local opt = vim.opt_local

opt.shiftwidth = 2
opt.commentstring = "# %s"
opt.t_local.tabstop = 2
opt.expandtab = true

-- Buffer variable for bash dialect
vim.b.is_bash = 1
