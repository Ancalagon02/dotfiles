local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

map("n", "<C-c>", "<cmd>noh<cr><esc>", { desc = "clear hlsearch", silent = true })
map("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "clear hlsearch", silent = true })

autocmd("LspAttach", {
  callback = function(e)
    local opts = { buffer = e.buf, silent = true }

    opts.desc = "Go to Definitions [LSP]"
    map("n", "<leader>vg", "<cmd>Telescope lsp_definitions<CR>", opts)

    opts.desc = "Go to Implementations [LSP]"
    map("n", "<leader>vi", "<cmd>Telescope lsp_implementations<CR>", opts)

    opts.desc = "Show References [LSP]"
    map("n", "<leader>vr", "<cmd>Telescope lsp_references<CR>", opts)

    opts.desc = "Show Type Definitions [LSP]"
    map("n", "<leader>vt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    opts.desc ="Open Diagnostics for file [LSP]"
    map("n", "<leader>vb", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    opts.desc = "Open Diagnostics [LSP]"
    map("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

    opts.desc = "Hover [LSP]"
    map("n", "K", function() vim.lsp.buf.hover() end, opts)

    opts.desc = "Code Action [LSP]"
    map({"n", "v"}, "<leader>va", function() vim.lsp.buf.code_action() end, opts)

    opts.desc = "Code Rename [LSP]"
    map("n", "<leader>vn", function() vim.lsp.buf.rename() end, opts)
    map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    opts.desc = "Show inlay Hints [LSP]"
    map("n", "<leader>vh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, opts)
  end
})

map("n", "<C-]>", "<cmd>cnext<cr>", { noremap = false, remap = true, silent = true, desc = "Quiclist next" })
map("n", "<C-[>", "<cmd>cprev<cr>", { noremap = false, remap = true, silent = true, desc = "Quiclist prev" })
map("n", "<leader>xq", function() vim.fn.setqflist({}) end, { noremap = false, remap = true, silent = true, desc = "Clear Quicklist" })

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
map("n", "<leader>we", "<C-W>=", { noremap = false, remap = true, desc = "Make window splits equal size", silent = true})

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv",  { noremap = true, silent = true })
