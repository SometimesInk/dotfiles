return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    -- Maximum file size this plugins will render
    max_file_size = 25.0,
    -- Time interval between updates when writing
    debounce = 250,
    file_types = { "markdown" },
    -- Render in all modes
    render_modes = true,
    padding = {
      -- Highlight to use when adding whitespace, should match background
      highlight = "Normal",
    },
    latex = { enabled = false },
    heading = {
      position = "inline",
    },
    code = {
      position = "left",
      below = "█",
    },
    -- Add checkboxes
    checkbox = {
      -- position = "overlay",
      unchecked = { icon = "✘ " },
      checked = { icon = "✔ ", scope_highlight = "@markup.strikethrough" },
      custom = { todo = { rendered = "◯ " } },
    },
    quote = {
      -- Wrapped quote lines render quote prefix
      repeat_linebreak = true,
    },
    -- Slightly modified from original config to make prefix heavier to differienciate between regular quotes
    callout = {
      note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo", quote_icon = "█" },
      tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess", quote_icon = "█" },
      important = {
        raw = "[!IMPORTANT]",
        rendered = "󰅾 Important",
        highlight = "RenderMarkdownHint",
        quote_icon = "█",
      },
      warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn", quote_icon = "█" },
      caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError", quote_icon = "█" },
      abstract = {
        raw = "[!ABSTRACT]",
        rendered = "󰨸 Abstract",
        highlight = "RenderMarkdownInfo",
        quote_icon = "█",
      },
      summary = { raw = "[!SUMMARY]", rendered = "󰨸 Summary", highlight = "RenderMarkdownInfo", quote_icon = "█" },
      tldr = { raw = "[!TLDR]", rendered = "󰨸 Tldr", highlight = "RenderMarkdownInfo", quote_icon = "█" },
      info = { raw = "[!INFO]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo", quote_icon = "█" },
      todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo", quote_icon = "█" },
      hint = { raw = "[!HINT]", rendered = "󰌶 Hint", highlight = "RenderMarkdownSuccess", quote_icon = "█" },
      success = {
        raw = "[!SUCCESS]",
        rendered = "󰄬 Success",
        highlight = "RenderMarkdownSuccess",
        quote_icon = "█",
      },
      check = { raw = "[!CHECK]", rendered = "󰄬 Check", highlight = "RenderMarkdownSuccess", quote_icon = "█" },
      done = { raw = "[!DONE]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess", quote_icon = "█" },
      question = {
        raw = "[!QUESTION]",
        rendered = "󰘥 Question",
        highlight = "RenderMarkdownWarn",
        quote_icon = "█",
      },
      help = { raw = "[!HELP]", rendered = "󰘥 Help", highlight = "RenderMarkdownWarn", quote_icon = "█" },
      faq = { raw = "[!FAQ]", rendered = "󰘥 Faq", highlight = "RenderMarkdownWarn", quote_icon = "█" },
      attention = {
        raw = "[!ATTENTION]",
        rendered = "󰀪 Attention",
        highlight = "RenderMarkdownWarn",
        quote_icon = "█",
      },
      failure = { raw = "[!FAILURE]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError", quote_icon = "█" },
      fail = { raw = "[!FAIL]", rendered = "󰅖 Fail", highlight = "RenderMarkdownError", quote_icon = "█" },
      missing = { raw = "[!MISSING]", rendered = "󰅖 Missing", highlight = "RenderMarkdownError", quote_icon = "█" },
      danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError", quote_icon = "█" },
      error = { raw = "[!ERROR]", rendered = "󱐌 Error", highlight = "RenderMarkdownError", quote_icon = "█" },
      bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError", quote_icon = "█" },
      example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint", quote_icon = "█" },
      quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote", quote_icon = "█" },
      cite = { raw = "[!CITE]", rendered = "󱆨 Cite", highlight = "RenderMarkdownQuote", quote_icon = "█" },
    },
    -- Window options to use that change between rendered and raw view
    win_options = {
      -- For that wrapped quote lines' first characters don't get overriden by quote prefix
      showbreak = { default = "", rendered = "  " },
      breakindent = { default = false, rendered = true },
      breakindentopt = { default = "", rendered = "" },
    },
  },
}
