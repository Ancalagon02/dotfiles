return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.*',

  opts = {
    keymap = {
      preset = 'default',
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-y>"] = { "select_and_accept", "fallback" },
      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

    },
    completion = { documentation = { auto_show = true } },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    signature = { enabled = true }
  },
}
