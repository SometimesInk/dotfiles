return {
  'saghen/blink.cmp',
  event = "InsertEnter",
  dependencies = {
    {
      "saghen/blink.lib",
    },
    {
      "saghen/blink.compat",
      opts = {
        enable_events = true
      }
    },
  },
  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    snippets = { preset = "luasnip" },
    sources = {
      default = { "lsp", 'path', "snippets", "buffer" },
      providers = {
        lsp = {
          score_offset = 10,
          module = "blink.cmp.sources.lsp",
        },
      }
    },
    fuzzy = { implementation = "lua" },
    keymap = {
      preset = "super-tab",
    },
    completion = {
      ghost_text = {
        enabled = true,
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
    },
  },
}
