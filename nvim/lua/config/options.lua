require("vim._core.ui2").enable()

vim.lsp.document_color.enable(true, nil, { style = "virtual" })

-- 2. Moving around, searching and patterns
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 4. Displaying text
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false -- Set to true if you want linebreak to function
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- 5. Syntax, highlighting and spelling
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"
vim.opt.pumborder = "rounded"

-- 11. Messages and info
vim.opt.signcolumn = "yes:1"

-- 13. Editing text
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "fuzzy", "noinsert", "noselect", "popup", "menuone"}

-- 14. Tabs and indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- 18. Reading and writing files
vim.opt.swapfile = false
