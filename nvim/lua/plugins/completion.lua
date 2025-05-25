return {
	"saghen/blink.cmp",
	dependencies = {
    "rafamadriz/friendly-snippets",
    "folke/lazydev.nvim",
    "MahanRahmati/blink-nerdfont.nvim",
  },
	version = "v0.*",
  config = function()
    local blink = require('blink.cmp')

    local function toggle_blink_completion()
      if blink.is_visible() then
        blink.hide()
      else
        blink.show()
      end
    end

    local function tab_action(cmp_instance)
      if cmp_instance.snippet_active() then
        return cmp_instance.accept()
      else
        return cmp_instance.accept()
      end
    end

    blink.setup({
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<C-space>"] = { "accept", "fallback_to_mappings" },
        -- ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = {
          toggle_blink_completion,
          "fallback",
        },
        ["<Tab>"] = {
          tab_action,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "scroll_documentation_up", "fallback" },
        ["<C-n>"] = { "scroll_documentation_down", "fallback" },
        -- ["<C-h>"] = { "show_signature", "hide_signature", "fallback" },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250,
          update_delay_ms = 50,
          treesitter_highlighting = true,
        },
        accept = { auto_brackets = { enabled = true } },
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
        menu = {
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
            treesitter = { "lsp" },
          },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
      },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer", "nerdfont", },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- Make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
          nerdfont = {
            module = "blink-nerdfont",
            name = "Nerd Fonts",
            score_offset = 15, -- Tune by preference
            opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
          },
          lsp = {
            min_keyword_length = 0, -- Number of characters to trigger provider
            score_offset = 0, -- Boost/penalize the score of the items
          },
          path = {
            min_keyword_length = 0,
          },
          snippets = {
            min_keyword_length = 2,
          },
          buffer = {
            min_keyword_length = 4,
            max_items = 5,
          },
        },
      },
      signature = { enabled = false },
    })
  end,
}
