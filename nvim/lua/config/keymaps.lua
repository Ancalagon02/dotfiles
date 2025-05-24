local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

map("n", "<C-c>", "<cmd>noh<cr><esc>", { desc = "clear hlsearch", silent = true })
map("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "clear hlsearch", silent = true })

autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        map("n", "<leader>vg", function() vim.lsp.buf.definition() end, { desc = "Go to definition [LSP]" })
        map("n", "<leader>vi", function() vim.lsp.buf.implementation() end, { desc = "Go to implementation [LSP]" })
        map("n", "K", function() vim.lsp.buf.hover() end, { desc = "Hover" })
        map("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = "Open Diagnostic [LSP]" })
        map({"n", "v"}, "<leader>va", function() vim.lsp.buf.code_action() end, { desc = "Code Action [LSP]" })
        map("n", "<leader>vr", function() vim.lsp.buf.references() end, { desc = "Show references [LSP]" })
        map("n", "<leader>vn", function() vim.lsp.buf.rename() end, { desc = "Code Rename [LSP]"})
        map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

map("n", "<leader>cl", "gcc", { noremap = false, remap = true, desc = "Toggle Comments" })
map({"n", "v"}, "<leader>cc", "gc", { noremap = false, remap = true, desc = "Toggle Comments lines" })

map("n", "<leader>ws", "<cmd>vsplit<cr><esc>", { desc = "Open Window", silent = true})
map("n", "<leader>wq", "<cmd>clo<cr><esc>", { desc = "Close Window", silent = true})
map("n", "<leader>wh", "<C-W>h", { noremap = false, remap = true, desc = "Move cursor to left", silent = true})
map("n", "<leader>wj", "<C-W>j", { noremap = false, remap = true, desc = "Move cursor to down", silent = true})
map("n", "<leader>wk", "<C-W>k", { noremap = false, remap = true, desc = "Move cursor to up", silent = true})
map("n", "<leader>wl", "<C-W>l", { noremap = false, remap = true, desc = "Move cursor to right", silent = true})
map("n", "<leader>w<", "<C-W>10>", { noremap = false, remap = true, desc = "Increase current window", silent = true})
map("n", "<leader>w>", "<C-W>10<", { noremap = false, remap = true, desc = "Decrease current window", silent = true})
